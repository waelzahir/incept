FROM debian:buster

RUN apt update && apt install bash gettext mariadb-server procps -y

COPY tools/ /root
COPY conf/  /etc/mysql/mariadb.conf.d/
RUN chmod +x /root/script.sh
EXPOSE 3306
ENTRYPOINT ["bash", "-c" , "/root/script.sh"]
