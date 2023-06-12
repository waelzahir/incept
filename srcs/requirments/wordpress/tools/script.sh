cp /root/www.conf /etc/php/7.3/fpm/pool.d/

if [ -f "/var/www/html/wp-config.php" ] 
then
    echo  -n
else
    mv /root/wpfiles/* /var/www/html/
    wp --allow-root config create --path='/var/www/html/' --dbhost="${MARIATARGET}" --dbname="${DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_USER_PASSWORD}"
    wp --allow-root core install  --path='/var/www/html/' --url='localhost' --title='42 blog' --admin_name="${WORDPRESS_ADMIN}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN}@student.1337.ma"

    head -n -1  /var/www/html/wp-config.php  > test
    cat test >  /var/www/html/wp-config.php
    echo "define( 'WP_REDIS_HOST', '10.10.10.6' );" >> /var/www/html/wp-config.php

    echo "define( 'WP_REDIS_PORT', '6379' );" >> /var/www/html/wp-config.php

    echo "define( 'WP_REDIS_SCHEME', 'tcp' );" >> /var/www/html/wp-config.php

    echo "define( 'WP_REDIS_DATABASE', '0' );" >> /var/www/html/wp-config.php
    echo "require_once ABSPATH . 'wp-settings.php';" >> /var/www/html/wp-config.php
    chown -R www-data:www-data /var/www/html/
    wp --allow-root --path='/var/www/html/' plugin install redis-cache
    wp --allow-root --path='/var/www/html/' plugin activate redis-cache
    wp --allow-root --path='/var/www/html/' redis enable
    # echo -n
fi
exec "$@"