FROM debian:buster
# Use the Debian Buster base image for the container

RUN apt-get update && apt-get upgrade -y
# Update and upgrade the system packages in the container

RUN apt-get -y install wget unzip
# Install wget and unzip tools in the container

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client
# Install PHP 7.3, PHP-FPM, PHP MySQL extension, and MariaDB client in the container

RUN	mkdir -p /var/www/html/wordpress
# Create a directory to store WordPress files

RUN chmod -R 755 /var/www/html/wordpress
# Set the appropriate permissions for the WordPress directory

RUN	chown -R root:root /var/www/html/wordpress
# Set the owner and group for the WordPress directory

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# Download the WP-CLI tool from the official GitHub repository

RUN chmod +x wp-cli.phar
# Make the downloaded WP-CLI tool executable

RUN mv wp-cli.phar /usr/local/bin/wp
# Move the WP-CLI tool to the /usr/local/bin directory

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
# Copy the custom www.conf file to the PHP-FPM configuration directory

COPY conf/config.sh /
# Copy the custom config.sh script to the root directory of the container

COPY /conf/wp-config.php /var/www/html/wordpress/wp-config.php
# Copy the custom wp-config.php file to the WordPress directory

RUN chmod +x config.sh
# Make the config.sh script executable

RUN mkdir -p /run/php/ && touch /run/php/php7.3-fpm.pid && chmod 777 /run/php/php7.3-fpm.pid
# Create a directory for PHP-FPM, create a PID file, and set appropriate permissions

ENTRYPOINT ["bash", "/config.sh"]
# Set the entrypoint of the container to execute the config.sh script

CMD ["php-fpm7.3", "-RF"]
# Set the default command to start PHP-FPM in the container


# Certainly! Here are some concepts related to the mentioned code `chown -p -R` and `ENTRYPOINT`, along with explanations:

# 1. **chown**: `chown` is a command in Unix-like operating systems that is used to change the ownership of files and directories. It stands for "change owner" and allows you to modify the user and/or group ownership of specified files/directories.

# 2. **-R**: The `-R` option is used with the `chown` command to perform a recursive ownership change. It means that not only the specified file or directory will have its ownership changed, but also all files and subdirectories within it.

# 3. **chown -p -R**: The `-p` option, when used with `chown`, preserves the symbolic links rather than following them and changing the ownership of the linked files/directories. This ensures that the symbolic links remain intact after changing the ownership recursively.

# 4. **ENTRYPOINT**: `ENTRYPOINT` is a directive in a Dockerfile that allows you to specify the command that will be executed when the container starts. It is used to define the primary executable for the container, which typically runs as a foreground process. The command specified in `ENTRYPOINT` is not overridden by `CMD` or any other command-line arguments passed when running the container.

# Now, let's explain the purpose of the mentioned code in the Dockerfile:

# ```Dockerfile
# RUN	chown -R root:root /var/www/html/wordpress
# ```

# In this line, `chown -R root:root /var/www/html/wordpress` is used to change the ownership of the `/var/www/html/wordpress` directory and its contents to the `root` user and `root` group. This ensures that the directory is owned by the root user, which is a common practice to maintain security and avoid unauthorized modifications.

# ```Dockerfile
# ENTRYPOINT ["bash", "/config.sh"]
# ```

# The `ENTRYPOINT` directive sets the primary command that will be executed when the container starts. In this case, it specifies the command `bash /config.sh`, which means that the `config.sh` script will be executed using the Bash shell as the entrypoint of the container. The `config.sh` script likely contains additional configuration or initialization logic for the container, which will be executed when the container starts.

# By using `chown` and `ENTRYPOINT` in the Dockerfile, the code ensures that the ownership of the WordPress directory is set correctly, and the `config.sh` script is executed as the primary command when the container starts.