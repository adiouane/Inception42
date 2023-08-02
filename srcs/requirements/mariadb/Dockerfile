# Sets the base image for the container
FROM debian:buster

# Updates the package lists in the image and upgrades any installed packages
RUN apt-get update && apt-get upgrade -y

# Installs the MariaDB server package in the image
RUN apt-get install mariadb-server -y

# Copies the `bind_adress.sh` file from the `tools` directory on the local machine to the root directory of the image
COPY tools/bind_adress.sh /

# Sets the executable permission on the `bind_adress.sh` file in the image
RUN chmod +x bind_adress.sh

# Specifies that the container should expose port 3306, which is the default port for MariaDB
EXPOSE 3306

# Specifies the entry point command for the container, which runs the `bind_adress.sh` script when the container starts.
ENTRYPOINT ["bash", "bind_adress.sh"]
