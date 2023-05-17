echo wordpress
ifconfig | grep inet
echo wordpress
if [ -d "/var/www/html/blog" ] 
then
    echo  -n
else
    mkdir -p /var/www/html/blog
    mv /root/wpfiles/* /var/www/html/blog
    wp --allow-root core config --path='/var/www/html/blog' --dbhost=test --dbname=test --dbuser=test --dbpass=test
    wp --allow-root core install  --path='/var/www/html/blog' --url='ozahir.42.fr' --title='42 blog' --admin_name="admin" --admin_password='admin' --admin_email='ozahir@student.1337.ma'
fi
exec "$@"