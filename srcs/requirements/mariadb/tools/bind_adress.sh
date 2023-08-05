#!/bin/bash
# Start the MariaDB service
service mariadb start
# # Wait for the MariaDB service to fully start
# sleep 1
# Create a new SQL file with the command to create the database
# It's like building a new room in your house for a special project.
# This command makes a special space in the database for our work.
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;"
# Add to the SQL file the command to create a new user with the specified credentials
# Think of it as making a new member with a unique name and secret code to enter the room.
# This command creates a new user with their special access details.
# % is a wildcard that means "any host"
mysql -u root -p -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;"
# Add to the SQL file the command to grant all privileges to the user on the specified database
# It's like giving someone all the keys to the new room you made.
# This command lets our new user have complete control over the database space.
mysql -u root -p -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;"
# Change the password for the 'root' user in the database
# It's like updating the lock on the main entrance of a secret room.
# This command changes the password for the main user of the database.
mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# Add to the SQL file the command to flush the privileges to ensure the changes take effect
# It's like refreshing a web page to see the latest changes.
# This makes sure that the new permissions and settings are applied right away.
mysql -u root -p -e "FLUSH PRIVILEGES;"
# Stop the MariaDB service
# It's like turning off a computer properly before doing anything else.
# This makes sure all data is saved and things are ready for the next steps.
service mariadb stop
# # Wait for the MariaDB service to stop
# sleep 1
# IMPORTANT: Ensure a clean environment by killing any existing MariaDB processes.
# This step ensures that any conflicts or lingering states from previous instances are cleared.
pkill -f mysqld
# Restart the MariaDB service with the IP address set to 0.0.0.0
# This allows the MariaDB server to listen on all available network interfaces,
# making it accessible from other devices or machines in the same network.
mysqld --bind-address=0.0.0.0
