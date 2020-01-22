--
-- Setup a user, create a database and grant access for the user
-- to the database.
--

-- Create the user 'user' with a backward compatible password algorithm
-- and the password 'pass'

-- Commands for MySQL
-- CREATE USER IF NOT EXISTS 'user'@'%'
--     IDENTIFIED WITH mysql_native_password
--     BY 'pass'
-- ;

-- Alternate for MariaDB
CREATE USER IF NOT EXISTS 'olov'@'localhost'
   IDENTIFIED BY 'Wim4rk'
;

-- Create user and assign a password, compatible between MySQL
-- and MariaDB. But it may require that MySQL 10.0 is setup to use
-- a backward compatible password algorithm, if you want to connect
-- using older clients.
-- CREATE USER IF NOT EXISTS 'user'@'%';
-- ALTER USER 'user'@'%' IDENTIFIED BY 'pass';

-- Create the database 'dbwebb', but only if it does not exists.
CREATE DATABASE IF NOT EXISTS dbwebb;

-- Grant the user all privilegies on the database.
GRANT ALL PRIVILEGES
    ON dbwebb.*
    TO 'olov'@'localhost'
;

