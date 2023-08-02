FROM debian:buster

# Update and upgrade the base Debian image
RUN apt-get update && apt-get upgrade -y

# Install NGINX and OpenSSL
RUN apt install nginx -y
RUN apt-get install openssl -y

# Create directories for SSL certificates
RUN mkdir -p /etc/nginx/ssl //TODO: IS TRUE directory ?

# Generate a self-signed SSL certificate using OpenSSL
RUN openssl req -newkey rsa:4096 -days 42 -nodes -x509 \
  -subj "/C=MR/ST=BENGRUIR/L=BENGRUIR/O=1337/CN=adiouane.42.fr" \
  -out /etc/ssl/certs/inception.crt \
  -keyout /etc/ssl/private/inception.key

# Copy the NGINX configuration file
COPY conf/default /etc/nginx/sites-available/default

# Start NGINX in the foreground
CMD [ "nginx", "-g", "daemon off;" ]
