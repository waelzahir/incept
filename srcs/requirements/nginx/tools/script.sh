#! /bin/bash 
echo "ng" '\n' >> /var/www/html/index.html 
ifconfig | grep "inet" >> /var/www/html/index.html 
nginx -g "daemon off;"