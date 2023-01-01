#! /bin/bash
echo "<p> maria </p> <p>" >> /var/www/html/index.html 
ifconfig | grep "inet" >> /var/www/html/index.html 
echo "</p>" >> /var/www/html/index.html 
cat /dev/urandom > /dev/null