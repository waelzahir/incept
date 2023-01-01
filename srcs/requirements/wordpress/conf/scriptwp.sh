#! /bin/bash
echo "<p> wp </p> <p>" >> /var/www/html/index.html 
ifconfig | grep "inet" >> /var/www/html/index.html 
echo "</p>" >> /var/www/html/index.html 
service php-fpm start 