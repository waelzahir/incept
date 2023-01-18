#! /bin/bash 
echo "nginx :" >> /var/www/html/index.html
env  >> /var/www/html/index.html
nginx -g "daemon off;"