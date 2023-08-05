FROM debian:bullseye

# Update and upgrade the base Debian image, install NGINX and OpenSSL
RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx openssl -y 

# Generate a self-signed SSL certificate using OpenSSL
RUN openssl req -days 42 -nodes -x509 \
    -subj "/C=MR/ST=BENGRUIR/L=BENGRUIR/O=1337/CN=adiouane.42.fr" \
    -out /etc/ssl/certs/inception.crt \
    -keyout /etc/ssl/private/inception.key
    
# req: This part specifies that you are using the req subcommand of OpenSSL to work with certificate signing requests.

# -newkey rsa:4096: This generates a new RSA private key with a length of 4096 bits. The private key is necessary for encrypting and decrypting data related to the certificate.

# -days 42: This sets the validity period of the certificate to 42 days.

# -nodes: This flag indicates that you're creating a key without a passphrase. In other words, the private key won't be protected by a password.

# -x509: This tells OpenSSL that you're generating a self-signed certificate (as opposed to a CSR that would be sent to a CA).

# -subj "/C=MR/ST=BENGRUIR/L=BENGRUIR/O=1337/CN=adiouane.42.fr": This sets the subject of the certificate, providing various pieces of information like country, state, location, organization, and common name (CN). In this case, it's creating a certificate for the domain adiouane.42.fr.

# -out /etc/ssl/certs/inception.crt: This specifies the path where the generated certificate will be saved.

# -keyout /etc/ssl/private/inception.key: This specifies the path where the generated private key will be saved.

# /C=MR: Country code. "MR" likely stands for Mauritania, where country codes are typically represented in two letters as per ISO 3166-1 alpha-2.

# /ST=BENGRUIR: State or province name. "BENGRUIR" could represent a specific state or province within the country.

# /L=BENGRUIR: Location, such as city or locality. Again, "BENGRUIR" seems to be used as a placeholder for the actual location.

# /O=1337: Organization name. "1337" could represent an organization, group, or company that the certificate is being generated for.

# /CN=adiouane.42.fr: Common name. This is typically the primary domain name associated with the certificate. In this case, it's "adiouane.42.fr".


# Copy the NGINX configuration file
COPY conf/default /etc/nginx/sites-available/default

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
