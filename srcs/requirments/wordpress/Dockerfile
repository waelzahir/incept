from debian:buster


run apt update
run apt -y install  bash php-fpm 
copy tools/entry.sh /
copy conf/www.conf etc/php/7.3/fpm/pool.d




ENTRYPOINT ["bash", "entry.sh"]
CMD ["php-fpm7.3", "-F"]