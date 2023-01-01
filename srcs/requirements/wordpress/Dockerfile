FROM debian:buster

RUN apt update && apt install vim bash net-tools php php-fpm  -y
COPY tools /root/
RUN chmod +x /root/scriptwp.sh
CMD ["bash", "-c", "/root/scriptwp.sh"]