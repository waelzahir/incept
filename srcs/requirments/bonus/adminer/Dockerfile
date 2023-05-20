FROM debian:buster

RUN apt update
RUN apt install php php-mysql curl -y 

COPY tools/ /root
COPY conf/ /root


ENTRYPOINT ["/bin/bash", "root/script.sh"]
CMD ["php", "-S", "[::]:8080", "-t", "/var/www/html/"]