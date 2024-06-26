const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const { dbConfig } = require('./config');
const cron = require('node-cron')
const multer = require('multer');
const path = require('path');
const fs = require('fs')
const jwt = require('jsonwebtoken');
const moment = require('moment');
const crypto = require('crypto');
const uuid = require('uuid');
const nodemailer = require('nodemailer');
const uuid = require('uuid');

const app = express();
const port = 3000;

app.use(express.json());
app.use(cors())
app.use('/uploads', express.static('uploads'));

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

// Create a Nodemailer transporter
const transporter = nodemailer.createTransport({
  service: 'gmail',
  port: 465,
  secure: true,
  auth: {
      user: 'app.martial.arts@gmail.com',
      pass: 'zxir vjtr gldz ogjw'
  }
});

const upload = multer({ storage });

secret_key = crypto.randomBytes(32).toString('hex');

const tokenStore = {};

const generateUniqueId = () => {
  return uuid.v4();
};

const generateToken = (userId) => {
  const payload = {
    userId,
    exp: moment().add(10, 'minutes').unix(),
  };
  const token = jwt.sign(payload, secret_key);
  const tokenId = generateUniqueId();
  tokenStore[tokenId] = token;
  return tokenId;
};

const constructVerificationLink = (userId) => {
  const tokenId = generateToken(userId);
  const link = `${process.env.SERVER}verify?tokenId=${tokenId}`;
  return link;
};

const sendVerificationEmail = (email, verificationLink, res) => {
  const mailOptions = {
      from: 'app.martial.arts@gmail.com',
      to: email,
      subject: 'Black Belt Tracker (Kids) Verification Link',
      text: `Click on this link to verify your Black Belt Tracker (Kids) Account: ${verificationLink}`
  };

  transporter.sendMail(mailOptions, (error, info) => {
      if (error) { 
          console.error('Error sending email:', error);
          res.status(500).send('Error sending verificationLink');
      } else {
          console.log('Email sent: ' + info.response);
          res.status(200).json({'verificationLink': verificationLink});
      }
  });
}

// Route for the home page
app.get('/', (req, res) => {
  res.send(`
    <h1>Contact Us</h1>
    <p>Email: mrhorton@masteryma.com</p>
    <p>Phone: +1 (401) 578-8070</p>
    <form action="/submit_message" method="post">
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required><br><br>
      <label for="message">Message:</label><br>
      <textarea id="message" name="message" rows="4" cols="50" required></textarea><br><br>
      <input type="submit" value="Submit">
    </form>
  `);
});

const privacyPolicy = `
<h1>Privacy Policy for Black Belt Tracker App</h1>

<p>At Black Belt Tracker, we prioritize the privacy and security of our users' personal information. This Privacy Policy outlines how we collect, use, and protect the information you provide when using our app.</p>

<h2>Information We Collect:</h2>

<ol>
  <li><strong>Account Creation:</strong> When you create an account with Black Belt Tracker, we collect basic information such as your name and email address to set up your account and allow you to log in securely.</li>
  <li><strong>Login Information:</strong> We securely store login credentials, including passwords, to facilitate access to your account and ensure the security of your personal information.</li>
</ol>

<h2>How We Use Your Information:</h2>

<ol>
  <li><strong>Account Management:</strong> We use the information collected during account creation and login processes to manage your account, provide access to our app's features, and personalize your experience.</li>
  <li><strong>Communication:</strong> We may occasionally send you important notifications related to your account, such as updates, announcements, or changes to our app's functionality or policies.</li>
  <li><strong>Improvement of Services:</strong> We may use aggregated and anonymized data for analytical purposes to understand user behavior, improve our app's performance, and enhance user satisfaction.</li>
</ol>

<h2>Data Security:</h2>

<p>We employ industry-standard security measures to safeguard the personal information you provide to us, including encryption and secure data storage practices. We continuously monitor our systems to protect against unauthorized access, disclosure, or alteration of your information.</p>

<h2>Sharing of Information:</h2>

<p>We do not sell, trade, or rent your personal information to third parties for any purpose. Your account information is strictly used for internal purposes related to providing and improving our app's services.</p>

<h2>Children's Privacy:</h2>

<p>Our app for children will be supported by their parents, they will help them with account and daily activities check. We have kids from 4 to 18+ years in our mastery, most of them can make their account rest will be help by their parents. Parents will be kept in loop by our mastery team and we will ensure child's privacy and concerns.</p>

<h2>Changes to This Privacy Policy:</h2>

<p>We reserve the right to update or modify this Privacy Policy at any time. Any changes will be effective immediately upon posting the updated policy on our app. We encourage you to review this Privacy Policy periodically for any updates.</p>

<h2>Contact Us:</h2>

<p>If you have any questions or concerns regarding this Privacy Policy or our data practices, please contact us at <a href="mailto:mrhorton@masteryma.com">mrhorton@masteryma.com</a>.</p>

<p>By using the Black Belt Tracker app, you agree to the terms and conditions outlined in this Privacy Policy.</p>

<p><em>Last updated: 28 March 2024</em></p>
`;

// Route for Privacy Policy
app.get('/privacypolicy', (req, res) => {
    res.send(privacyPolicy);
});


// Route for submitting messages
app.post('/submit_message', (req, res) => {
  const { email, message } = req.body;
  // Here you can handle the submitted message, such as saving it to a database
  
  // Respond with acknowledgment
  res.send("Your response is collected");
});


app.get('/verify', (req, res) => {
  const tokenId = req.query.tokenId;

  const token = tokenStore[tokenId];

  if (!token) {
    return res.status(401).json({ error: 'Invalid or expired verification link' });
  }

  jwt.verify(token, secret_key, (err, decoded) => {
    if (err) {
      return res.status(401).json({ error: 'Invalid token ' + err });
    }

    const userId = decoded.userId.id;

    const currentTime = Math.floor(Date.now() / 1000);
    if (decoded.exp < currentTime) {
      return res.status(401).json({ error: 'Token has expired' });
    }

    const updateVerificationSql = 'UPDATE users SET verified = ? WHERE id = ?';
    db.query(updateVerificationSql, [true, userId], (err, result) => {
      if (err) {
        console.error('Error updating user verification:', err);
        return res.status(500).json({ error: 'Error updating user verification ' + err  });
      }

      delete tokenStore[tokenId];

      res.status(200).json({ message: 'Verification successful' });
    });
  });
});


// Delete user route
app.delete('/delete_user/:userId', (req, res) => {
  const userId = req.params.userId;

  // Delete user from daily_activities table first
  const deleteActivitiesQuery = 'DELETE FROM daily_activities WHERE user_id = ?';
  db.query(deleteActivitiesQuery, [userId], (activitiesErr, activitiesResult) => {
    if (activitiesErr) {
      console.error('Error deleting user activities:', activitiesErr);
      res.status(500).json({ error: 'Error deleting user activities' });
      return;
    }

    // Query to delete the user with the specified ID
    const deleteUserQuery = 'DELETE FROM users WHERE id = ?';
    db.query(deleteUserQuery, [userId], (err, result) => {
      if (err) {
        console.error('Error deleting user:', err);
        res.status(500).json({ error: 'Error deleting user' });
        return;
      }

      // Check if any rows were affected (i.e., if the user was found and deleted)
      if (result.affectedRows === 0) {
        res.status(404).json({ error: 'User not found' });
        return;
      }

      // User and related activities deleted successfully
      res.status(200).json({ message: 'User and related activities deleted successfully' });
    });
  });
});


app.post('/upload-image', upload.single('image'), (req, res) => {
  // Handle the uploaded file here
  const { filename } = req.file;
  const { user_id } = req.body;

  // Get the user's old profile picture filename
  const getOldProfilePicSql = 'SELECT profilepic FROM users WHERE id = ?';
  db.query(getOldProfilePicSql, [user_id], (err, result) => {
    if (err) {
      console.error('Error retrieving old profile pic: ' + err);
      res.status(500).json({ error: 'Error retrieving old profile pic ' + err  });
      return;
    }

    const oldProfilePicFilename = result[0].profilepic;

    const updateProfilePicSql = 'UPDATE users SET profilepic = ? WHERE id = ?';
    db.query(updateProfilePicSql, [filename, user_id], (err, result) => {
      if (err) {
        console.error('Error adding pic: ' + err);
        res.status(500).json({ error: 'Error adding profile pic ' + err  });
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

app.get('/user-info/:user_id', (req, res) => {
  const user_id = req.params.user_id;
  const sql = 'SELECT * FROM users WHERE id = ?';
  db.query(sql, [user_id], (err, result) => {
    if (err) {
      console.error('Error logging in: ' + err);
      res.status(500).json({ error: 'Error logging in' });
      return;
    }
    res.status(200).json(result[0]);
    return;
  })
})


app.get('/profilepic/:user_id', (req, res) => {
  const user_id = req.params.user_id;

  // Query the database to get the filename associated with the user_id
  const sql = 'SELECT profilepic FROM users WHERE id = ?';
  db.query(sql, [user_id], (err, result) => {
    if (err) {
      console.error('Error fetching profile pic: ' + err);
      res.status(500).json({ error: 'Error fetching profile pic ' + err  });
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
        res.status(500).json({ error: 'Error reading image file ' + err  });
        return;
      }

      // Send the image file as bytes in the response
      res.writeHead(200, { 'Content-Type': 'image/jpeg' });
      res.end(data);
    });
  });
});


app.get('/resetStreak', (req, res) => {
    console.log('Updating streaks');
  const currentDate = new Date().toISOString().slice(0, 10);

  // Update streaks for users with daily_activities count less than 12
  const updateQuery = `
        UPDATE users 
        SET monthlyStreak = 0 
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

// cron.schedule('* * * * *', () => {
//   console.log('truncating daily_activities table...')
//   // Truncate daily_activities table
//   db.query('TRUNCATE TABLE daily_activities', (truncateErr, truncateResult) => {
//     if (truncateErr) {
//         console.error('Error truncating table:', truncateErr);
//         return;
//     }
//     console.log('Table truncated successfully');
//     });


//     db.query('UPDATE users SET monthly = 0', (truncateErr, truncateResult) => {
//     if (truncateErr) {
//           console.error('Error truncating table:', truncateErr);
//         return;
//     }
//     console.log('Table truncated successfully');
//     });
// });


app.get('/truncade', (req, res) => {
  console.log('truncating daily_activities table...')
  // Truncate daily_activities table
  db.query('TRUNCATE TABLE daily_activities', (truncateErr, truncateResult) => {
    if (truncateErr) {
        console.error('Error truncating table:', truncateErr);
        return;
    }
    console.log('Table truncated successfully');
    });


    db.query('UPDATE users SET monthly = 0, monthlyStreak = 0', (truncateErr, truncateResult) => {
    if (truncateErr) {
          console.error('Error truncating table:', truncateErr);
        return;
    }
    console.log('Table truncated successfully');
    });
});

app.post('/signup', (req, res) => {
  const { fullname, username, password, email } = req.body;

  // Check if username already exists
  const usernameQuery = 'SELECT * FROM users WHERE username = ?';
  db.query(usernameQuery, [username], (err, existingUser) => {
    if (err) {
      console.error('Error checking existing username: ' + err);
      res.status(500).json({ error: 'Error signing up ' + err  });
      return;
    }

    if (existingUser.length > 0) {
      // Username already exists, return error response
      res.status(400).json({ error: 'Username already exists' });
      return;
    }

    // Username is unique, proceed with sign up process

    // Generate a salt
    bcrypt.genSalt(10, (err, salt) => {
      if (err) {
        console.error('Error generating salt: ' + err);
        res.status(500).json({ error: 'Error signing up ' + err });
        return;
      }

      // Hash the password using the salt
      bcrypt.hash(password, salt, (err, hashedPassword) => {
        if (err) {
          console.error('Error hashing password: ' + err);
          res.status(500).json({ error: 'Error signing up ' + err });
          return;
        }

        const sql = 'INSERT INTO users (fullname, username, password, salt, email, verified, signup_time) VALUES (?, ?, ?, ?, ?, ?, ?)';
        const signupTime = new Date();
        db.query(sql, [fullname, username, hashedPassword, salt, email, false, signupTime], (err, result) => {
          if (err) {
            console.error('Error signing up: ' + err);
            res.status(500).json({ error: 'Error signing up ' + err});
            return;
          }

          const sql = 'SELECT * FROM users WHERE username = ?';
          db.query(sql, [username], (err, result) => {
            const userId = result[0]
            const verificationLink = constructVerificationLink(userId);
            sendVerificationEmail(email, verificationLink, res);
            sendVerificationEmail(email, verificationLink, res);
            res.status(201).json({ msg: 'Email Verification Pending' })
          });
        });
      });
    });
  });
});

cron.schedule('* * * * *', async () => {
  try {
    const sql = 'SELECT * FROM users WHERE verified = 0 AND signup_time <= NOW() - INTERVAL 10 MINUTE';
    db.query(sql, (err, usersToDelete) => {
      if (err) {
        console.error('Error retrieving unverified users:', err);
        return;
      }
      for (const user of usersToDelete) {
        const deleteSql = 'DELETE FROM users WHERE id = ?';
        db.query(deleteSql, [user.id], (err) => {
          if (err) {
            console.error(`Error deleting user ${user.username}:`, err);
            return;
          }
          console.log(`User ${user.username} deleted due to unverified status and signup time exceeded 10 minutes.`);
        });
      }
    });
  } catch (error) {
    console.error('Error executing cron job:', error);
  }
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
        const insertUserQuery = 'INSERT INTO users (fullname, username, password, salt, email, verified, signup_time) VALUES (?, ?, ?, ?, ?, ?, ?)';
        const signupTime = new Date();
        db.query(insertUserQuery, [fullname, username, hashedPassword, salt, email, true, signupTime], (err, result) => {
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
          if (hashedPassword === result[0].password && result[0].verified == 1) {
            res.status(200).json(result[0]);
          } else if (hashedPassword === result[0].password && result[0].verified == 0) {
            res.status(402).json({ msg: 'User not verified' });
          } else {
            res.status(403).json({ error: 'Invalid username or password' });
          }
        })
      }
    });
  });
  
  
  
  app.post('/add-activity', (req, res) => {
    const { user_id, activity, answer, completed } = req.body;
    const currentDate = new Date().toISOString().slice(0, 10);

    const sql = 'INSERT INTO daily_activities (user_id, activity, _date, answer) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE _date = VALUES(_date), answer = VALUES(answer)';
    db.query(sql, [user_id, activity, currentDate, answer], (err, result) => {
        if (err) {
            console.error('Error adding activity: ' + err);
            res.status(500).json({ error: 'Error adding activity ' + err });
            return;
        }
        if (!completed) {
          const updatePointsSql = 'UPDATE users SET points = points + 5, monthly = monthly  + 5 WHERE id = ?';
          db.query(updatePointsSql, [user_id], (updateErr, updateResult) => {
              if (updateErr) {
                  console.error('Error updating points: ' + updateErr);
                  res.status(500).json({ error: 'Error updating points ' + updateErr });
                  return;
              }
          });
        }

        // Activity added successfully, now get all activities of the user
        const getAllActivitiesSql = 'SELECT * FROM daily_activities WHERE user_id = ? AND _date = ?';
            db.query(getAllActivitiesSql, [user_id, currentDate], (getErr, activities) => {
                if (getErr) {
                    console.error('Error fetching activities: ' + getErr);
                    res.status(500).json({ error: 'Error fetching activities ' + getErr });
                    return;
                }

            // Check if the length of activities is 12
            if (activities.length === 12) {
                // Increment user's streaks by 1
                const updateStreaksSql = 'UPDATE users SET streaks = streaks + 1, monthlyStreak = monthlyStreak + 1 WHERE id = ?';
                db.query(updateStreaksSql, [user_id], (updateErr, updateResult) => {
                    if (updateErr) {
                        console.error('Error updating streaks: ' + updateErr);
                        res.status(500).json({ error: 'Error updating streaks ' + updateErr });
                        return;
                    }
                });
            }

            res.status(201).json({ message: 'Activity added successfully and streaks updated if applicable' });
        });
    });
});
  
//   // Add daily activity route
//   app.post('/add-activity', (req, res) => {
//     const { user_id, activity, answer } = req.body;
//     console.log(req.body);
//     const currentDate = new Date().toISOString().slice(0, 10);

//     const sql = 'INSERT INTO daily_activities (user_id, activity, _date, answer) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE _date = VALUES(_date), answer = VALUES(answer)';
//     db.query(sql, [user_id, activity, currentDate, answer], (err, result) => {
//         if (err) {
//             console.error('Error adding activity: ' + err);
//             res.status(500).json({ error: 'Error adding activity' });
//             return;
//         }

//         const updatePointsSql = 'UPDATE users SET points = points + 5 WHERE id = ?';
//         db.query(updatePointsSql, [user_id], (updateErr, updateResult) => {
//             if (updateErr) {
//                 console.error('Error updating points: ' + updateErr);
//                 res.status(500).json({ error: 'Error updating points' });
//                 return;
//             }
//         });

//         // Activity added successfully, now get all activities of the user
//         const getAllActivitiesSql = 'SELECT * FROM daily_activities WHERE user_id = ? AND _date = ?';
//             db.query(getAllActivitiesSql, [user_id, currentDate], (getErr, activities) => {
//                 if (getErr) {
//                     console.error('Error fetching activities: ' + getErr);
//                     res.status(500).json({ error: 'Error fetching activities' });
//                     return;
//                 }

//             // Check if the length of activities is 12
//             if (activities.length === 12) {
//                 // Increment user's streaks by 1
//                 const updateStreaksSql = 'UPDATE users SET streaks = streaks + 1 WHERE id = ?';
//                 db.query(updateStreaksSql, [user_id], (updateErr, updateResult) => {
//                     if (updateErr) {
//                         console.error('Error updating streaks: ' + updateErr);
//                         res.status(500).json({ error: 'Error updating streaks' });
//                         return;
//                     }
//                 });
//             }

//             res.status(201).json({ message: 'Activity added successfully and streaks updated if applicable' });
//         });
//     });
// });
 
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

  app.get('/users/streaks/:id', (req, res) => {
    const id = req.params.id
    const sqlStreaks = `SELECT streaks,monthlyStreak FROM users WHERE id = ${id}`

    db.query(sqlStreaks, (streaksErr, streaksResult) => {
      if (streaksErr) {
        console.error('Error fetching streaks by id: ' + streaksErr);
        res.status(500).json({ error: 'Error fetching user streaks' });
        return;
      }

      res.status(200).json(streaksResult);
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