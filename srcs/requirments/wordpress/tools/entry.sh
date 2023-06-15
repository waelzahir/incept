mkdir /run/php/
if [ ! -f "/var/www/html/index.php" ] 
then
    wp-cli.phar --allow-root core download --path='/var/www/html/'
    wp-cli.phar --allow-root config create --path='/var/www/html/' --dbhost="10.10.10.3" --dbname="wordpress" --dbuser="muser" --dbpass="${MYSQL_USER_PASSWORD}"
    wp-cli.phar --allow-root core install  --path='/var/www/html/' --url='ozahir.42.fr' --title='42 blog' --admin_name="fb_mnn" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="ozahir@student.1337.ma"
    wp-cli.phar --allow-root user create --path='/var/www/html/' ozahir ozahir@1337.student.ma --user_pass=${WP_USR_PASS} --role=author
    
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