DROP USER IF EXISTS 'dbwebb'@'%';

CREATE USER 'dbwebb'@'%'
IDENTIFIED
-- IF MySQL is being used:
-- WITH mysql_native_password -- Only MySQL > 8.0.4
BY 'password'
;

GRANT ALL PRIVILEGES
ON *.*
TO 'dbwebb'@'%'
WITH GRANT OPTION
;

--
-- Check the status for users root, dbwebb and user.
--
SELECT
    User,
    Host,
    Grant_priv,
    plugin
FROM mysql.user
WHERE
    User IN ('root', 'dbwebb', 'user')
ORDER BY User
;
