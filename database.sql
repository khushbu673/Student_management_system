--Student management system database schema
-- Created by: Khushbu Bind



CREATE DATABASE student_db;
USE student_db;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(200)
    
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
);

INSERT INTO users (username, password) 
VALUES ('admin', 'admin123');

SHOW TABLES;
SELECT * FROM users;
SELECT * FROM students;
use student_db;
alter table students add column age int;