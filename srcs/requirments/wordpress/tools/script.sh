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
    cd /var/www/html/ && wp core install  --allow-root --url=127.0.0.1 \
            --title=inception --admin_user=$WP_ADMIN \
            --admin_password=$WP_ADMIN_PASS \
            --admin_email=ozahir@student.1337.ma \
            --skip-email
    cd /var/www/html/ && wp user create $WPUSER $WPUSER@42.fr \
        --role=author --user_pass=$WP_USER_PASS --allow-root
fi
php-fpm7.3 -F