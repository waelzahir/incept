#! /bin/bash 
echo "<p> ng </p> <p>" >> /var/www/html/index.html 
ifconfig | grep "inet" >> /var/www/html/index.html 
echo "</p>" >> /var/www/html/index.html 
nginx -g "daemon off;"