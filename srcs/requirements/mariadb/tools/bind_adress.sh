#!/bin/bash

# Start the MySQL service
service mysql start 

# Create a new SQL file with the command to create the database
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" 

# Add to the SQL file the command to create a new user with the specified credentials
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;"

# Add to the SQL file the command to grant all privileges to the user on the specified database
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;"

# Add to the SQL file the command to flush the privileges to ensure the changes take effect
mysql -e "FLUSH PRIVILEGES;"

# Stop the MySQL service
service mysql stop

# Kill the MySQL process
kill $(cat /var/run/mysqld/mysqld.pid)

# Restart the MySQL service with the IP address set to 0.0.0.0
mysqld --bind-address=0.0.0.0
