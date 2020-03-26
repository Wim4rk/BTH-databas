-- Create database
CREATE DATABASE IF NOT EXISTS webshop
DEFAULT CHARSET=utf8
COLLATE=utf8_swedish_ci
;

USE webshop;

-- Add user
CREATE USER IF NOT EXISTS 'user'@'%'
    IDENTIFIED
    BY 'pass'
;

GRANT ALL PRIVILEGES
    ON webshop.*
    TO 'user'@'%'
;
