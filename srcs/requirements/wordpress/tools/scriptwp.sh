#! /bin/bash
echo "<p> wp </p> <p>" >> /var/www/html/index.html 
ifconfig | grep "inet" >> /var/www/html/index.html 
echo "</p>" >> /var/www/html/index.html 
$(ls /usr/sbin/php-fpm*) -F -R 