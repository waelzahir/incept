FROM debian:buster

RUN apt update
RUN apt install mariadb-server bash procps  gettext-base net-tools wget -y


COPY tools/script.sh /root
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/mysql_default /root
COPY conf/database_conf /root
RUN chmod +x /root/script.sh


ENTRYPOINT ["/bin/bash", "root/script.sh"]
CMD ["mysqld_safe"]
