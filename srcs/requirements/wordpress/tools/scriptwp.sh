#! /bin/bash
wget https://wordpress.org/latest.tar.gz
tar -xzvf *tar.gz
mv wordpress /var/www/html
rm -rf latest.tar.gz
$(ls /usr/sbin/php-fpm*) -F -R 