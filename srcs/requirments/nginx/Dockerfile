FROM debian:buster

RUN apt update
RUN apt install net-tools nginx openssl bash mariadb-client -y

COPY tools/ /root

COPY conf/ /etc/nginx/conf.d/

RUN chmod +x /root/script.sh
RUN openssl req -x509 -newkey rsa:4096 \
    -keyout /etc/ssl/private/key.pem  \
    -out /etc/ssl/private/cert.pem -sha256 -days 3650 -nodes -subj "/"

ENTRYPOINT ["/bin/bash", "root/script.sh"]

CMD ["nginx", "-g", "daemon off;"]
