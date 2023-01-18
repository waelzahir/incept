#! /bin/bash
usermod -a -G mysql mysql
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld/
mysqld