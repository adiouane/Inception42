# Sets the base image for the container
FROM debian:bullseye

# Updates the package lists in the image and upgrades any installed packages
# apt-get is a package manager for Debian-based Linux distributions
# Installs the MariaDB server package in the image
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y mariadb-server 


# Copies the `bind_adress.sh` file from the `tools` directory on the local machine to the root directory of the image
COPY tools/bind_adress.sh /

# Sets the executable permission on the `bind_adress.sh` file in the image
RUN chmod +x bind_adress.sh

# Specifies the entry point command for the container, which runs the `bind_adress.sh` script when the container starts.
CMD ["bash", "bind_adress.sh"]
