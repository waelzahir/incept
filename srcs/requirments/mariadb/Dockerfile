FROM debian:buster

RUN apt update
RUN apt install mariadb-server bash net-tools -y

COPY tools/script.sh /root
RUN chmod +x /root/script.sh

EXPOSE 3306

ENTRYPOINT ["/bin/bash", "root/script.sh"]
CMD ["mysqld"]
