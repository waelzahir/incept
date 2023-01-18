#! /bin/bash
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
if test -f "/var/www/html/index.php"; then
    echo "wp exist"
else
    tar -xf /root/latest.tar.gz -C /var/www/html/ --strip-components=1
    rm -rf /root/latest.tar.gz
fi
echo "wp :" >> /var/www/html/index.html
env  >> /var/www/html/index.html
php-fpm7.3 -F