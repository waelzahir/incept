from debian:buster

run groupadd -r mysql && useradd -r -g mysql mysql

run apt update
run apt -y install  bash mariadb-server  gettext-base procps expect

copy tools/entry.sh /
copy conf/conf.sql /root
copy conf/50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT ["bash", "entry.sh"]
CMD ["mysqld_safe"]