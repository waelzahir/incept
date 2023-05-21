FROM debian:buster

RUN apt update
RUN apt install  php7.3-fpm mariadb-client bash net-tools php-mysql sendmail curl less -y
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp


RUN chmod +x /usr/local/bin/wp
RUN mkdir -p /run/php
RUN mkdir -p /var/www/html/adminer
RUN touch /run/php/php7.3-fpm.sock

RUN wp --allow-root core download --path='/root/wpfiles' --locale=en_US

COPY tools/script.sh /root
COPY conf/www.conf /root
RUN chmod +x /root/script.sh

ENTRYPOINT ["/bin/bash", "root/script.sh"]
CMD ["php-fpm7.3", "-F", "-R"]
