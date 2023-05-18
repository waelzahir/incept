echo maria
ifconfig | grep inet
echo maria
if [ -d "/var/lib/mysql/wordpress" ] 
then
    echo  -n
else
   service mysql start
   mysql_secure_installation   < /root/mysql_default > /dev/null 2>&1
   mysql -u root < /root/database_conf > /dev/null 2>&1
#    mysqladmin -u root shutdown
#    kill $(cat /run/mysqld/mysqld.pid)
fi
sleep 20
exec "$@"