FROM debian:buster
RUN apt update && apt install apt-utils -y

RUN apt update && apt install bash curl php php-mysql php-fpm procps mariadb-client -y

RUN curl -S https://wordpress.org/latest.tar.gz -o /root/latest.tar.gz
COPY tools/ /root
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN chmod +x /root/script.sh
EXPOSE 9000

ENTRYPOINT ["bash", "-c" , "/root/script.sh"]