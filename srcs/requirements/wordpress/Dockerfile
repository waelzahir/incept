FROM debian:buster

RUN apt update && apt install wget php php-fpm -y
COPY tools /root/
RUN chmod +x /root/scriptwp.sh
EXPOSE 9000 3306
CMD ["bash", "-c", "/root/scriptwp.sh"]