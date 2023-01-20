#! /bin/bash
usermod -a -G mysql mysql 
mkdir -p /var/run/mysqld 
chown -R mysql:mysql /var/run/mysqld/ 

if test -f "/var/lib/mysql/hiddenf.sql"; then
    echo "database already configured"
else
    envsubst < /root/mysql.conf > /var/lib/mysql/hiddenf.sql
    service  mysql start
    mysql -u root < /var/lib/mysql/hiddenf.sql
    service mysql stop
fi
mysqld
