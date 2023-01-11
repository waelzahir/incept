FROM debian:buster

RUN apt update && apt install vim bash net-tools php php-fpm  -y
COPY tools /root/
RUN chmod +x /root/scriptwp.sh
EXPOSE 9000 3306
CMD ["bash", "-c", "/root/scriptwp.sh"]