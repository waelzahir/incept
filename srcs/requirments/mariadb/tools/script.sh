



if [ -d "/var/lib/mysql/wordpress" ] 
then
    echo ha
else
    service mysql start
    envsubst < /root/database_conf | mysql -u root 
    mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
fi

exec "$@"