const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const { dbConfig } = require('./config');
const cron = require('node-cron')

const app = express();
const port = 3000;

app.use(express.json());
app.use(cors())

const db = mysql.createPool(dbConfig);
const bcrypt = require('bcrypt');

cron.schedule('0 0 * * *', () => {
  console.log('Updating streaks and truncating daily_activities table...');

  // Update streaks for users with daily_activities count less than 12
  const updateQuery = `
      UPDATE users 
      SET streaks = 0 
      WHERE id IN (
          SELECT user_id 
          FROM daily_activities 
          GROUP BY user_id 
          HAVING COUNT(*) < 12
      )
  `;
  db.query(updateQuery, (err, updateResult) => {
      if (err) {
          console.error('Error updating streaks:', err);
          return;
      }
      console.log('Streaks updated successfully');

      // Truncate daily_activities table
      db.query('TRUNCATE TABLE daily_activities', (truncateErr, truncateResult) => {
          if (truncateErr) {
              console.error('Error truncating table:', truncateErr);
              return;
          }
          console.log('Table truncated successfully');
      });
  });
});

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
        res.status(201).json({ message: 'Signup successful' });
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
    const { user_id, activity } = req.body;

    const sql = 'INSERT INTO daily_activities (user_id, activity) VALUES (?, ?)';
    db.query(sql, [user_id, activity], (err, result) => {
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
        const getAllActivitiesSql = 'SELECT * FROM daily_activities WHERE user_id = ?';
        db.query(getAllActivitiesSql, [user_id], (getErr, activities) => {
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
    
      const sql = 'SELECT activity FROM daily_activities WHERE user_id = ?';
      db.query(sql, [user_id], (err, result) => {
        if (err) {
          console.error('Error fetching activities: ' + err);
          res.status(500).json({ error: 'Error fetching activities' });
          return;
        }
        res.status(200).json(result);
      });
    });
  
    // Add new reward route
  app.post('/reward/add', (req, res) => {
      const { expirydate, name, description, image } = req.body;
    
      const sql = 'INSERT INTO rewards (expirydate, name, description, image) VALUES (?, ?, ?, ?)';
      db.query(sql, [expirydate, name, description, image], (err, result) => {
        if (err) {
          console.error('Error adding reward: ' + err);
          res.status(500).json({ error: 'Error adding reward' });
          return;
        }
        res.status(201).json({ message: 'Reward added successfully' });
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