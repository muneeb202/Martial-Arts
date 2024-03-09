const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const { dbConfig } = require('./config');

const app = express();
const port = 3000;

app.use(express.json());
app.use(cors())

const db = mysql.createPool(dbConfig);
const bcrypt = require('bcrypt');

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

      const sql = 'INSERT INTO users (fullname, username, password, email) VALUES (?, ?, ?, ?)';
      db.query(sql, [fullname, username, hashedPassword, email], (err, result) => {
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
  
    const sql = 'SELECT * FROM users WHERE username = ? AND password = ?';
    db.query(sql, [username, password], (err, result) => {
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
      res.status(200).json({ message: 'Login successful', user: result[0] });
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
        res.status(201).json({ message: 'Activity added successfully' });
      });
    });
    
    // Get all activities for a user route
    app.get('/activities/:user_id', (req, res) => {
      const user_id = req.params.user_id;
    
      const sql = 'SELECT * FROM daily_activities WHERE user_id = ?';
      db.query(sql, [user_id], (err, result) => {
        if (err) {
          console.error('Error fetching activities: ' + err);
          res.status(500).json({ error: 'Error fetching activities' });
          return;
        }
        res.status(200).json({ activities: result });
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