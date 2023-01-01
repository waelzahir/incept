#! /bin/bash 

ifconfig | grep "inet" > /var/www/html/index.html 
nginx -g "daemon off;"