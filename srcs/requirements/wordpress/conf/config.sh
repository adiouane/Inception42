#!/bin/bash

# Install WordPress

# Create the directory for WordPress if it doesn't exist
mkdir -p /run/php
sleep 24

# Change to the WordPress directory
cd /var/www/html/wordpress/

# Download the WordPress core files using WP-CLI (WordPress Command Line Interface)
wp core download --allow-root --path="/var/www/html/wordpress/"

chmod -R 777 /var/www/html/wordpress/wp-content

wp config create --path="/var/www/html/wordpress/" --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${DB_HOST} --allow-root --skip-check

# Install WordPress using WP-CLI
wp core install --allow-root \
  --path="/var/www/html/wordpress/" \
  --url=${WP_URL} \
  --title=${WP_TITLE} \
  --admin_user=${MYSQL_USER} \
  --admin_password=${MYSQL_PASSWORD} \
  --admin_email=${WP_ADMIN_EMAIL}

# Create a new user with administrative privileges using WP-CLI
wp user create --allow-root ${MYSQL_USER} ${WP_ADMIN_EMAIL} --user_pass=${MYSQL_PASSWORD}

#  Set the default command to start PHP-FPM in the container
# exec php-fpm7.4 -F
exec /usr/sbin/php-fpm7.4 -F

# WordPress setup is complete
echo "Wordpress: set up!"
