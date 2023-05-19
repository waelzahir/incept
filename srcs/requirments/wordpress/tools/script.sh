echo wordpress
ifconfig | grep inet
echo wordpress
if [ -d "/var/www/html/blog" ] 
then
    echo  -n
else
    sleep 20
    mkdir -p /var/www/html/blog
    mv /root/wpfiles/* /var/www/html/blog
    wp --allow-root config create --path='/var/www/html/blog' --dbhost="${MARIATARGET}" --dbname="${DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_USER_PASSWORD}"
    wp --allow-root core install  --path='/var/www/html/blog' --url='localhost' --title='42 blog' --admin_name="${WORDPRESS_ADMIN}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN}@student.1337.ma"
fi
exec "$@"