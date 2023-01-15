#! /bin/bash
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
tar -xf /root/latest.tar.gz -C /var/www/html/ --strip-components=1
rm -rf /root/latest.tar.gz
$(ls /usr/sbin/ | grep php-fpm) -F