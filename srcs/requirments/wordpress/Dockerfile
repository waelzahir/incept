FROM debian:buster

RUN apt update
RUN apt install php7.3-fpm mariadb-client bash net-tools -y

COPY tools/script.sh /root
RUN chmod +x /root/script.sh

ENTRYPOINT ["/bin/bash", "root/script.sh"]
CMD ["php-fpm7.3"]
