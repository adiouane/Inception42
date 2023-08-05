# Use the Debian Buster base image for the container
FROM  debian:bullseye

# Update and upgrade the system packages in the container
#  install php7.4 and its dependencies like php-fpm and php-mysql in the container

RUN apt-get update && apt-get upgrade -y \
    && apt-get -y install wget \
    && apt-get install -y php7.4 php-fpm php-mysql  

# Create a directory to store WordPress files
# Set the appropriate permissions for the WordPress directory
# Set the owner and group for the WordPress directory
# Download the WP-CLI tool from the official GitHub repository
# Make the downloaded WP-CLI tool executable
# Move the WP-CLI tool to the /usr/local/bin directory
RUN mkdir -p /var/www/html/wordpress \
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy the custom www.conf file to the PHP-FPM configuration directory
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Copy the custom config.sh script to the root directory of the container
COPY conf/config.sh /

# Copy the custom wp-config.php file to the WordPress directory
COPY /conf/wp-config.php /var/www/html/wordpress/wp-config.php

# Make the config.sh script executable
# Create a directory for PHP-FPM, create a PID file, and set appropriate permissions
RUN chmod +x config.sh \
    && mkdir -p /run/php/ 

# run the config.sh script
CMD ["bash", "/config.sh"]
