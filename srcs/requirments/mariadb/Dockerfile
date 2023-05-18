FROM debian:buster

RUN apt update
RUN apt install mariadb-server bash procps net-tools -y

COPY tools/script.sh /root
COPY conf/mysql_default /root
COPY conf/database_conf /root

RUN chmod +x /root/script.sh

EXPOSE 3306

ENTRYPOINT ["/bin/bash", "root/script.sh"]
CMD ["mysqld_safe"]
