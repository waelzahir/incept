alter user 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
create user 'muser'@'%' identified by '${MYSQL_USER_PASSWORD}';
create database wordpress;
grant all privileges on wordpress.* to 'muser'@'%';
flush privileges ;
exit