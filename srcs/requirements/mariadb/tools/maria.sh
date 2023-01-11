#! /bin/bash
echo "<p> maria </p> <p>" >> /var/www/html/index.html 
ifconfig | grep "inet" >> /var/www/html/index.html 
echo "</p>" >> /var/www/html/index.html 
ls /var/lib >> /var/www/html/index.html
mysqld