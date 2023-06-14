mkdir /run/php/
if [ ! -f "/var/www/html/index.php" ] 
then
    wp-cli.phar --allow-root core download --path=/var/www/html/
    wp-cli.phar --allow-root config create --path='/var/www/html/' --dbhost="${DB_HOST}" --dbname="${DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_USER_PASSWORD}"
    wp-cli.phar --allow-root core install  --path='/var/www/html/' --url='ozahir.42.fr' --title='42 blog' --admin_name="${WORDPRESS_ADMIN}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN}@student.1337.ma"
    wp-cli.phar --allow-root user create --path='/var/www/html/' ${WP_USR} ${WP_USR}@student.1337.ma --user_pass=${WP_USR_PASS} --role=author
    head -n -1  /var/www/html/wp-config.php  > test 
    cat test >  /var/www/html/wp-config.php
    echo "define( 'WP_REDIS_HOST', '10.10.10.10' );" >> /var/www/html/wp-config.php

    echo "define( 'WP_REDIS_PORT', '6379' );" >> /var/www/html/wp-config.php

    echo "define( 'WP_REDIS_SCHEME', 'tcp' );" >> /var/www/html/wp-config.php

    echo "define( 'WP_REDIS_DATABASE', '0' );" >> /var/www/html/wp-config.php
    echo "require_once ABSPATH . 'wp-settings.php';" >> /var/www/html/wp-config.php
    wp-cli.phar --allow-root --path='/var/www/html/' plugin install redis-cache
    wp-cli.phar --allow-root --path='/var/www/html/' plugin activate redis-cache
    wp-cli.phar --allow-root --path='/var/www/html/' redis enable
fi
chown -R www-data:www-data /var/www/html/
exec "$@"