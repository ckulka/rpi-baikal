# Set the base image
FROM ckulka/rpi-nginx

# File Author / Maintainer
MAINTAINER Cyrill Kulka


## BEGIN INSTALLATION

# Version of Baikal
ENV VERSION 0.2.7

# Download & extract baikal
RUN \
	apt-get install curl &&\
	curl http://baikal-server.com/get/baikal-regular-$VERSION.tgz | tar xz --strip-components=1 -C /var/www &&\
	chown -R www-data:www-data /var/www &&\
	apt-get autoremove curl

# Install PHP & SQLite3
RUN apt-get install php5-fpm php5-sqlite sqlite3

# Add the nginx configuration
COPY files/default /etc/nginx/sites-available/default

# Create a self-signed certificate
RUN apt-get install openssl &&\
	openssl req -x509 -newkey rsa:2048 -subj "/C=DE/ST=/L=/O=N=lo" -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -days 3650 -nodes &&\
	apt-get autoremove openssl &&\
	apt-get clean

# Copy start script
COPY files/start-nginx-php5.sh /opt/


## IMAGE CONFIGURATION

VOLUME /var/www/Specific

CMD ["bash", "/opt/start-nginx-php5.sh"]
