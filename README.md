This repository provides a Dockerfile for Baikal (http://baikal-server.com/) on Raspberry Pi.

# Build Docker Image

```
# Shell working directory is where this README.md is
docker build -t ckulka/rpi-baikal .
docker run --rm -it -p 80:80 -p 443:443 ckulka/rpi-baikal
```


# Persistent Data

The folder ```/var/www/Specific``` contains the persistent data. It's marked as volume and should be part of a regular backup.
