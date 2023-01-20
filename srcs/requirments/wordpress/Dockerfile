FROM debian:buster
RUN apt update && apt install apt-utils -y

RUN apt update && apt install bash curl php php-mysql php-fpm procps mariadb-client -y

RUN curl -S https://wordpress.org/latest.tar.gz -o /root/latest.tar.gz
RUN curl -S https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/bin/wp && chmod +x /usr/bin/wp
COPY tools/ /root
COPY conf/ /root

RUN chmod +x /root/script.sh
EXPOSE 9000

ENTRYPOINT ["bash", "-c" , "/root/script.sh"]