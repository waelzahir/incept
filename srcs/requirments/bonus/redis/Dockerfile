from debian:buster

RUN apt update
RUN apt install bash redis-server -y

COPY tools/ /root
copy conf/ /root

ENTRYPOINT ["bash", "/root/script.sh"]
CMD ["redis-server", "/etc/redis/redis.conf", "--daemonize" ,"no"]