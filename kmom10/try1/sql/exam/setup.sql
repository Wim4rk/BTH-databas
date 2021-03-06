-- Create database
CREATE DATABASE IF NOT EXISTS exam;

USE exam;

-- Show DB with a name similar to *exam*
SHOW DATABASES LIKE "%exam%";

-- Add user
CREATE USER IF NOT EXISTS 'user'@'%'
    IDENTIFIED
    BY 'pass'
;

GRANT ALL PRIVILEGES
    ON exam.*
    TO 'user'@'%'
;
