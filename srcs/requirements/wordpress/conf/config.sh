#!/bin/bash

# Install WordPress

# Create the directory for WordPress if it doesn't exist
sleep 25
echo "Wordpress: creating users..."
if [ ! -d /var/www/html/wordpress ]; then
  mkdir -p /var/www/html/wordpress
fi

# Change to the WordPress directory
cd /var/www/html/wordpress/

# Download the WordPress core files using WP-CLI (WordPress Command Line Interface)
wp core download --allow-root --path="/var/www/html/wordpress/"


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
exec php-fpm7.4 -F

# WordPress setup is complete
echo "Wordpress: set up!"

# Start process to keep the container running
exec "$@"
