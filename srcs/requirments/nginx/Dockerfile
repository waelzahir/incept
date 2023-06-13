from debian:buster

run apt update
run apt -y install nginx bash openssl

copy tools/entry.sh /
copy conf/config /etc/nginx/conf.d/inception.conf

ENTRYPOINT ["bash", "entry.sh"]
CMD ["nginx", "-g", "daemon off;"]