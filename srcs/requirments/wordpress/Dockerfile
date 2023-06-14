from debian:buster


run apt update
run apt -y install  bash php-fpm  curl gettext-base mariadb-client php-mysql
run curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

run mv wp-cli.phar  /usr/local/bin/
run chmod +x  /usr/local/bin/wp-cli.phar


copy tools/entry.sh /
copy conf/www.conf etc/php/7.3/fpm/pool.d




ENTRYPOINT ["bash", "entry.sh"]
CMD ["php-fpm7.3", "-F"]