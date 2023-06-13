alter user 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
create user '${MYSQL_USER}'@'%' identified by '${MYSQL_USER_PASSWORD}';
create database ${DATABASE};
grant all privileges on ${DATABASE}.* to '${MYSQL_USER}'@'${HOST}';
flush privileges ;
exit