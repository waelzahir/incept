echo wordpress
ifconfig | grep inet
echo wordpress
cp /root/www.conf /etc/php/7.3/fpm/pool.d/
if [ -f "/var/www/html/wp-config.php" ] 
then
    echo  -n
else
    sleep 20
    mv /root/wpfiles/* /var/www/html/
    wp --allow-root config create --path='/var/www/html/' --dbhost="${MARIATARGET}" --dbname="${DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_USER_PASSWORD}"
    wp --allow-root core install  --path='/var/www/html/' --url='localhost' --title='42 blog' --admin_name="${WORDPRESS_ADMIN}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN}@student.1337.ma"
fi
exec "$@"