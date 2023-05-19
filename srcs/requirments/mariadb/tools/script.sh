



if [ -d "/var/lib/mysql/wordpress" ] 
then
    echo ha
else
    echo -n
    # envsubst < /root/database_conf | mysql -u root 
fi

exec "$@"