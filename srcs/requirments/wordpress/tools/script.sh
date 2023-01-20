#! /bin/bash
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
if test -f "/var/www/html/wp-config.php"; then
    echo "wp exist"
else
    tar -xf /root/latest.tar.gz -C /var/www/html/ --strip-components=1
    rm -rf /root/latest.tar.gz
    sed -i -e 's|'keyN01'|'$WP_DATABASE'|g'  /root/wp-config.php 
    sed -i -e 's|'keyN02'|'$DB_USER'|g'  /root/wp-config.php 
    sed -i -e 's|'keyN03'|'$DB_PASSWORD'|g'  /root/wp-config.php
    sed -i -e 's|'keyN04'|'$DB_HOST'|g'  /root/wp-config.php 
    cp /root/wp-config.php /var/www/html/
    cp /root/www.conf /etc/php/7.3/fpm/pool.d
fi
php-fpm7.3 -F