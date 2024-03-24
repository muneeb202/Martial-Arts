CREATE DATABASE martial_arts;
USE martial_arts;

CREATE TABLE IF NOT EXISTS users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	fullname VARCHAR(255) NOT NULL,
	username VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
    salt VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	streaks INT DEFAULT 0,
	points INT DEFAULT 0,
    signup_time Date,
    verified INT default 0,
    monthly INT DEFAULT 0,
    profilepic VARCHAR(255) 
);


CREATE TABLE IF NOT EXISTS daily_activities (
	user_id INT,
	activity INT NOT NULL,
    answer varchar(255),
    _date Date,
    PRIMARY KEY (user_id, activity, _date),
	FOREIGN KEY (user_id) REFERENCES users(id)
);
