from debian:buster

run apt update
run apt -y install nginx bash openssl

run openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /etc/ssl/private/cert.key -out /etc/ssl/certs/cert.crt -subj "/"

copy tools/entry.sh /
copy conf/config /etc/nginx/conf.d/inception.conf

ENTRYPOINT ["bash", "entry.sh"]
CMD ["nginx", "-g", "daemon off;"]