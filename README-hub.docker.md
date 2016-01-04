Short: Baikal on Raspberry Pi


This repository provides an image for Baikal (http://baikal-server.com/) on Raspberry Pi.
Automated builds currently fail since Docker Hub currently doesn't support ARM platforms.

For more details, see https://github.com/ckulka/rpi-baikal

### Run
```
docker run --rm -it -p 80:80 -p 443:443 ckulka/rpi-baikal
```

### Persistent Data
The folder /var/www/Specific contains the persistent data. It's marked as volume and should be part of a regular backup.
