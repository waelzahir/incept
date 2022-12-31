FROM debian:buster

RUN apt update && apt install nginx vim bash openssl -y

RUN mkdir -p /root/tools 

COPY tools /root/tools

RUN mv /root/tools/conf /etc/nginx/conf.d/default.conf

RUN chmod +x /root/tools/script.sh

RUN openssl req -x509 -nodes -days 365 -subj "/C=MA/ST=KH/O='42 school'/CN=ozahir.42.fr"   -newkey rsa:2048 -keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt

EXPOSE 443

CMD ["bash", "-c", "/root/tools/script.sh"]