-- -- Create a database named 'wordpress' if it doesn't already exist
-- CREATE DATABASE IF NOT EXISTS wordpress;

-- -- Create a user named 'adiouane' with access from any host '%' and a password 'adiouane123'
-- CREATE USER IF NOT EXISTS 'adiouane'@'%' IDENTIFIED BY 'adiouane123';

-- -- Grant all privileges on the 'wordpress' database to the 'adiouane' user from any host
-- -- WITH GRANT OPTION allows the user to grant privileges to other users
-- GRANT ALL PRIVILEGES ON wordpress.* TO 'adiouane'@'%' WITH GRANT OPTION;

-- -- Set a new password '123' for the 'root' user when connecting from localhost
-- SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123');

-- -- Create a user named 'adiouane2' with access from any host '%' and a password '123'
-- CREATE USER IF NOT EXISTS 'adiouane2'@'%' IDENTIFIED BY '123';

-- -- Flush the privileges to ensure changes take effect immediately
-- FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'adiouane'@'%' IDENTIFIED BY 'adiouane123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'adiouane'@'%' WITH GRANT OPTION;
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123');
CREATE USER IF NOT EXISTS 'adiouane2'@'%' IDENTIFIED BY '123';
FLUSH PRIVILEGES;