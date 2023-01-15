#! /bin/bash 
ls  /var/www/html/ >> /var/www/html/index.html 
nginx -g "daemon off;"