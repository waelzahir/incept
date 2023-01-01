#! /bin/bash
echo "wp" '\n' >> /var/www/html/index.html 
ifconfig | grep "inet" >> /var/www/html/index.html 
#php-fpm7.3 -F
cat /dev/urandom > /dev/null