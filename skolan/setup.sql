-- Create database
CREATE DATABASE IF NOT EXISTS skolan;

USE skolan;

-- Show DB with a name similar to *skolan*
SHOW DATABASES LIKE "%skolan%";

-- Add user
CREATE USER IF NOT EXISTS 'user'@'%'
    IDENTIFIED
    BY 'pass'
;

GRANT ALL PRIVILEGES
    ON skolan.*
    TO 'user'@'%'
;
