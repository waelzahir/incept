from debian:buster


run apt update
run apt -y install  php php-mysql

copy tools/entry.sh /
copy conf/adminer.php /var/www/html/

ENTRYPOINT ["bash", "entry.sh"]
CMD ["php", "-S", "0.0.0.0:8000" ,"/var/www/html/adminer.php"]