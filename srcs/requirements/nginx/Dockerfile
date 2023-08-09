
# Use the official Debian image for the base image
FROM debian:bullseye

# Update and upgrade the base Debian image, install NGINX and OpenSSL
RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx openssl -y 

# Generate a self-signed SSL certificate using OpenSSL
RUN openssl req -days 42 -nodes -x509 \
    -subj "/C=MR/ST=BENGRUIR/L=BENGRUIR/O=1337/CN=adiouane.42.fr" \
    -out /etc/ssl/certs/inception.crt \
    -keyout /etc/ssl/private/inception.key

# Copy the NGINX configuration file
COPY conf/default /etc/nginx/sites-available/default

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
