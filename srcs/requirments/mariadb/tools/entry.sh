
# chown -R mysql:mysql /var/run/mysqld

if [ ! -d "/var/lib/mysql/wordpress" ] 
then
    mysql_install_db
    /etc/init.d/mysql start
    SECURE_MYSQL=$(expect -c "
    set timeout 10
    spawn mysql_secure_installation
    expect \"Enter current password for root (enter for none):\"
    send \"\r\"
    expect \"Change the root password?\"
    send \"n\r\"
    expect \"Remove anonymous users?\"
    send \"y\r\"
    expect \"Disallow root login remotely?\"
    send \"y\r\"
    expect \"Remove test database and access to it?\"
    send \"y\r\"
    expect \"Reload privilege tables now?\"
    send \"y\r\"
    expect eof
    ")
    cat /root/conf.sql | envsubst | mysql -u root
    mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown 

fi
exec "$@"