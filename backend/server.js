const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const { dbConfig } = require('./config');
const cron = require('node-cron')
const multer = require('multer');
const path = require('path');
const fs = require('fs')

const app = express();
const port = 3000;

app.use(express.json());
app.use(cors())
app.use('/uploads', express.static('uploads'));

const db = mysql.createPool(dbConfig);
const bcrypt = require('bcrypt');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/'); // Specify the directory where you want to store the uploaded files
  },
  filename: (req, file, cb) => {
    const originalName = file.originalname; // Get the original filename
    const extension = path.extname(originalName);
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const filename = path.basename(originalName, extension) + '-' + uniqueSuffix + extension;
    cb(null, filename);
  }
});

const upload = multer({ storage });

app.post('/upload-image', upload.single('image'), (req, res) => {
  // Handle the uploaded file here
  const { filename } = req.file;
  const { user_id } = req.body;

  // Get the user's old profile picture filename
  const getOldProfilePicSql = 'SELECT profilepic FROM users WHERE id = ?';
  db.query(getOldProfilePicSql, [user_id], (err, result) => {
    if (err) {
      console.error('Error retrieving old profile pic: ' + err);
      res.status(500).json({ error: 'Error retrieving old profile pic' });
      return;
    }

    const oldProfilePicFilename = result[0].profilepic;

    const updateProfilePicSql = 'UPDATE users SET profilepic = ? WHERE id = ?';
    db.query(updateProfilePicSql, [filename, user_id], (err, result) => {
      if (err) {
        console.error('Error adding pic: ' + err);
        res.status(500).json({ error: 'Error adding profile pic' });
        return;
      }

      console.log(`Image uploaded: ${filename}`);

      if (oldProfilePicFilename) {
        fs.unlink(`uploads/${oldProfilePicFilename}`, (err) => {
          if (err) {
            console.error('Error deleting old profile pic: ' + err);
          } else {
            console.log('Old profile pic deleted successfully');
          }
        });
      }

      res.send('Image uploaded successfully');
    });
  });
});


app.get('/profilepic/:user_id', (req, res) => {
  const user_id = req.params.user_id;

  // Query the database to get the filename associated with the user_id
  const sql = 'SELECT profilepic FROM users WHERE id = ?';
  db.query(sql, [user_id], (err, result) => {
    if (err) {
      console.error('Error fetching profile pic: ' + err);
      res.status(500).json({ error: 'Error fetching profile pic' });
      return;
    }

    // Check if the user exists
    if (result.length === 0) {
      res.status(404).json({ error: 'User not found' });
      return;
    }

    // Retrieve the filename from the query result
    const filename = result[0].profilepic;

    // Read the image file from the filesystem
    const imagePath = `uploads/${filename}`;
    fs.readFile(imagePath, (err, data) => {
      if (err) {
        console.error('Error reading image file: ' + err);
        res.status(500).json({ error: 'Error reading image file' });
        return;
      }

      // Send the image file as bytes in the response
      res.writeHead(200, { 'Content-Type': 'image/jpeg' });
      res.end(data);
    });
  });
});


cron.schedule('0 0 * * *', () => {
  console.log('Updating streaks');

  // Update streaks for users with daily_activities count less than 12
  const updateQuery = `
        UPDATE users 
        SET streaks = 0 
        WHERE id IN (
            SELECT user_id 
            FROM daily_activities 
            WHERE _date = ? 
            GROUP BY user_id 
            HAVING COUNT(*) < 12
        )
    `;
    db.query(updateQuery, [currentDate], (updateErr, updateResult) => {
        if (updateErr) {
            console.error('Error updating streaks:', updateErr);
            return;
        }
        console.log('Streaks updated successfully');
  });
});

cron.schedule('0 0 1 * *', () => {
  console.log('truncating daily_activities table...')
  // Truncate daily_activities table
  db.query('TRUNCATE TABLE daily_activities', (truncateErr, truncateResult) => {
    if (truncateErr) {
        console.error('Error truncating table:', truncateErr);
        return;
    }
    console.log('Table truncated successfully');
});
})

app.post('/signup', (req, res) => {
  const { fullname, username, password, email } = req.body;

  // Generate a salt
  bcrypt.genSalt(10, (err, salt) => {
    if (err) {
      console.error('Error generating salt: ' + err);
      res.status(500).json({ error: 'Error signing up' });
      return;
    }

    // Hash the password using the salt
    bcrypt.hash(password, salt, (err, hashedPassword) => {
      if (err) {
        console.error('Error hashing password: ' + err);
        res.status(500).json({ error: 'Error signing up' });
        return;
      }

      const sql = 'INSERT INTO users (fullname, username, password, salt, email) VALUES (?, ?, ?, ?, ?)';
      db.query(sql, [fullname, username, hashedPassword, salt, email], (err, result) => {
        if (err) {
          console.error('Error signing up: ' + err);
          res.status(500).json({ error: 'Error signing up' });
          return;
        }

        const sql = 'SELECT * FROM users WHERE username = ?';
        db.query(sql, [username], (err, result) => {
          res.status(201).json(result[0]);
        })
      });
    });
  });
});

app.post('/google-signup', (req, res) => {
  const { fullname, username, password, email } = req.body;
  console.log(req.body);

  // Generate a salt
  bcrypt.genSalt(10, (err, salt) => {
    if (err) {
      console.error('Error generating salt: ' + err);
      return res.status(500).json({ error: 'Error signing up' });
    }

    // Hash the password using the salt
    bcrypt.hash(password, salt, (err, hashedPassword) => {
      if (err) {
        console.error('Error hashing password: ' + err);
        return res.status(500).json({ error: 'Error signing up' });
      }

      // Check if the user already exists
      const checkUserQuery = 'SELECT * FROM users WHERE username = ?';
      db.query(checkUserQuery, [username], (err, existingUser) => {
        if (err) {
          console.error('Error checking user: ' + err);
          return res.status(500).json({ error: 'Error signing up' });
        }

        if (existingUser.length > 0) {
          return res.status(200).json(existingUser[0]);
        }

        // Insert the new user into the database
        const insertUserQuery = 'INSERT INTO users (fullname, username, password, salt, email) VALUES (?, ?, ?, ?, ?)';
        db.query(insertUserQuery, [fullname, username, hashedPassword, salt, email], (err, result) => {
          if (err) {
            console.error('Error inserting user: ' + err);
            return res.status(500).json({ error: 'Error signing up' });
          }

          // Retrieve the newly created user
          const getUserQuery = 'SELECT * FROM users WHERE username = ?';
          db.query(getUserQuery, [username], (err, newUser) => {
            if (err) {
              console.error('Error retrieving user: ' + err);
              return res.status(500).json({ error: 'Error signing up' });
            }
            
            res.status(201).json(newUser[0]);
          });
        });
      });
    });
  });
});


  
  // Login route
  app.post('/login', (req, res) => {
    const { username, password } = req.body;
  
    const sql = 'SELECT * FROM users WHERE username = ?';
    db.query(sql, [username], (err, result) => {
      if (err) {
        console.error('Error logging in: ' + err);
        res.status(500).json({ error: 'Error logging in' });
        return;
      }
      console.log(result)
      if (result.length === 0) {
        res.status(401).json({ error: 'Invalid username or password' });
        return;
      }
  
      // Assuming successful login, you might return user data or a token here
      else {
        bcrypt.hash(password, result[0].salt, (err, hashedPassword) => {
          if (err) {
            console.error('Error hashing password: ' + err);
            res.status(500).json({ error: 'Error logging in' });
            return;
          }

          if (hashedPassword === result[0].password) {
            res.status(200).json(result[0]);
          }

          else {
            res.status(401).json({ error: 'Incorrect password' });
          }
        })
      }
    });
  });
  
  // Add daily activity route
  app.post('/add-activity', (req, res) => {
    const { user_id, activity, answer } = req.body;
    console.log(req.body);
    const currentDate = new Date().toISOString().slice(0, 10);

    const sql = 'INSERT INTO daily_activities (user_id, activity, _date, answer) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE _date = VALUES(_date), answer = VALUES(answer)';
    db.query(sql, [user_id, activity, currentDate, answer], (err, result) => {
        if (err) {
            console.error('Error adding activity: ' + err);
            res.status(500).json({ error: 'Error adding activity' });
            return;
        }

        const updatePointsSql = 'UPDATE users SET points = points + 5 WHERE id = ?';
        db.query(updatePointsSql, [user_id], (updateErr, updateResult) => {
            if (updateErr) {
                console.error('Error updating points: ' + updateErr);
                res.status(500).json({ error: 'Error updating points' });
                return;
            }
        });

        // Activity added successfully, now get all activities of the user
        const getAllActivitiesSql = 'SELECT * FROM daily_activities WHERE user_id = ? AND _date = ?';
            db.query(getAllActivitiesSql, [user_id, currentDate], (getErr, activities) => {
                if (getErr) {
                    console.error('Error fetching activities: ' + getErr);
                    res.status(500).json({ error: 'Error fetching activities' });
                    return;
                }

            // Check if the length of activities is 12
            if (activities.length === 12) {
                // Increment user's streaks by 1
                const updateStreaksSql = 'UPDATE users SET streaks = streaks + 1 WHERE id = ?';
                db.query(updateStreaksSql, [user_id], (updateErr, updateResult) => {
                    if (updateErr) {
                        console.error('Error updating streaks: ' + updateErr);
                        res.status(500).json({ error: 'Error updating streaks' });
                        return;
                    }
                });
            }

            res.status(201).json({ message: 'Activity added successfully and streaks updated if applicable' });
        });
    });
});
 
    // Get all activities for a user route
    app.get('/activities/:user_id', (req, res) => {
      const user_id = req.params.user_id;
      const currentDate = new Date().toISOString().slice(0, 10);
      const getAllActivitiesSql = 'SELECT * FROM daily_activities WHERE user_id = ? AND _date = ?';
      db.query(getAllActivitiesSql, [user_id, currentDate], (err, result) => {
        if (err) {
          console.error('Error fetching activities: ' + err);
          res.status(500).json({ error: 'Error fetching activities' });
          return;
        }
        res.status(200).json(result);
      });
    });

    // Get all activities for a user route
    app.get('/all-activities/:user_id', (req, res) => {
      const user_id = req.params.user_id;
      const getAllActivitiesSql = 'Select activity, Count(*) as count from daily_activities where user_id=? group by activity';
      db.query(getAllActivitiesSql, [user_id], (err, result) => {
        if (err) {
          console.error('Error fetching activities: ' + err);
          res.status(500).json({ error: 'Error fetching activities' });
          return;
        }
        res.status(200).json(result);
      });
    });

    
  // Get top 10 users by highest streak route
  app.get('/users/top-10', (req, res) => {
    const sql = 'SELECT * FROM users ORDER BY streaks DESC LIMIT 10';
    db.query(sql, (err, result) => {
      if (err) {
        console.error('Error fetching top users: ' + err);
        res.status(500).json({ error: 'Error fetching top users' });
        return;
      }
      res.status(200).json({ top_users: result });
    });
  });

  app.get('/users/top-10-streaks', (req, res) => {
    const sqlTopStreaks = 'SELECT * FROM users ORDER BY streaks DESC';
  
    db.query(sqlTopStreaks, (streaksErr, streaksResult) => {
      if (streaksErr) {
        console.error('Error fetching top users by streaks: ' + streaksErr);
        res.status(500).json({ error: 'Error fetching leaderboard data' });
        return;
      }  
        res.status(200).json(streaksResult);
    });
  });
  
  app.get('/users/top-10-points', (req, res) => {
    const sqlTopPoints = 'SELECT * FROM users ORDER BY points DESC';
  
    db.query(sqlTopPoints, (pointsErr, pointsResult) => {
      if (pointsErr) {
        console.error('Error fetching top users by points: ' + pointsErr);
        res.status(500).json({ error: 'Error fetching leaderboard data' });
        return;
      }

      console.log(pointsResult)
      res.status(200).json(pointsResult);
    });
  });
    
  // Start the server
  app.listen(port, () => {
    console.log(`Server is running on port localhost:${port}`);
  });
  
  // Handle Ctrl+C signal to gracefully close MySQL connection
  process.on('SIGINT', () => {
    db.end((err) => {
      console.log('MySQL connection closed');
      process.exit(err ? 1 : 0);
    });
  });