Short: Baikal on Raspberry Pi


This repository provides an image for Baikal (http://baikal-server.com/) on Raspberry Pi.
Automated builds currently fail since Docker Hub currently doesn't support ARM platforms.

For more details, see https://github.com/ckulka/rpi-baikal

### Run
The following command will run Baikal, including HTTPS over self-signed certificates:
```
docker run --rm -it -p 80:80 -p 443:443 ckulka/rpi-baikal
```
If you want to use your own certificates, either hide this container behind your own HTTPS proxy or you mount your certificates into the container (see [ckulka/rpi-nginx](https://hub.docker.com/r/ckulka/rpi-nginx)).

### Persistent Data
The folder ```/var/www/Specific``` contains the persistent data. It's marked as volume and should be part of a regular backup.
