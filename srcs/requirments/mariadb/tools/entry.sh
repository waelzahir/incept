
# chown -R mysql:mysql /var/run/mysqld
if [ ! -d "/var/lib/mysql/wordpress" ] 
then
    service mysql start
    cat /root/conf.sql | envsubst | mysql -u root
    mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown 
fi
exec "$@"