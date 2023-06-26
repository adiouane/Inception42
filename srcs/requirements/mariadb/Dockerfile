# FROM debian:buster

# # Update the package repository and install MariaDB server
# RUN apt-get update -y \
#     && apt-get install mariadb-server -y

# # Copy the data.sql file to the appropriate location
# COPY /tools/data.sql /var/www/data.sql

# # Copy the bind_adress.sh script to the root directory
# COPY /tools/bind_adress.sh /
# # Grant execution permission to bind_adress.sh
# RUN chmod +x /bind_adress.sh

# # Start the MySQL service, import the data.sql file, and remove it
# RUN service mysql start && mysql < /var/www/data.sql && rm -f /var/www/data.sql;
# # mysql < /var/www/data.sql: This command uses the MySQL client (mysql) to import the data.sql file into the MySQL database. The < symbol is used for input redirection, specifying that the data.sql file should be used as input for the mysql command.
# # rm -f /var/www/data.sql: This command removes the data.sql file from the container. The -f flag is used to force the removal without prompting for confirmation.
# # So, in summary, the line starts the MySQL service, imports the SQL data from the data.sql file into the MySQL database, and then removes the data.sql file from the container. This sequence of commands ensures that the database is set up with the provided data and cleans up the unnecessary SQL file afterward.

# # Set the default command to run the MySQL daemon
# CMD ["mysqld"]
# # daemon is a computer program that runs as a background process, rather than being under the direct control of an interactive user. The MySQL daemon (mysqld) is the main program that does most of the work in a MySQL server. It is a server process that manages access to the MySQL data directory, provides access to all databases, manages concurrent requests from multiple clients, and performs other essential tasks.


# # Set the entrypoint to execute the bind_adress.sh script
# ENTRYPOINT ["bash", "/bind_adress.sh"]

# #ENTRYPOINT is used to configure the container to run a specific command when it is started. It is similar to CMD, but the command specified in ENTRYPOINT is always executed, whereas the command specified in CMD can be overridden by providing arguments to the docker run command. In this case, the bind_adress.sh script is executed when the container is started.
FROM debian:buster

RUN apt-get update -y \
    && apt-get install mariadb-server -y

COPY /tools/data.sql /var/www/data.sql
COPY /tools/bind_adress.sh /
RUN chmod +x /bind_adress.sh
RUN service mysql start && mysql < /var/www/data.sql && rm -f /var/www/data.sql;
CMD ["mysqld"]
ENTRYPOINT ["bash", "/bind_adress.sh"]