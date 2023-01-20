#! /bin/bash
usermod -a -G mysql mysql 
mkdir -p /var/run/mysqld 
chown -R mysql:mysql /var/run/mysqld/ 

if test -f "/var/run/mysqld/hiddenf.sql"; then
    echo "database already configured"
else
    envsubst < /root/mysql.conf > /var/run/mysqld/hiddenf.sql
    service  mysql start
    mysql -u root < /var/run/mysqld/hiddenf.sql
    service mysql stop
fi
mysqld
