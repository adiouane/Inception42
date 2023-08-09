# Sets the base image for the container
FROM debian:bullseye

# Updates the package lists in the image and upgrades any installed packages
# Installs the MariaDB server package in the image
# mariadb-server is the package name for the MariaDB server package wich helps to install the MariaDB server
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y mariadb-server 

COPY tools/bind_adress.sh /
RUN chmod +x bind_adress.sh

# Specifies the entry point command for the container, which runs the `bind_adress.sh` script when the container starts.
CMD ["bash", "bind_adress.sh"]
