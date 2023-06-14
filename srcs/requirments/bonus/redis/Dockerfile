from debian:buster


run apt update
run apt -y install  bash  redis-server

copy tools/entry.sh /
copy conf/redis.conf /etc/redis/redis.conf

ENTRYPOINT ["bash", "entry.sh"]
CMD ["redis-server", "/etc/redis/redis.conf", "--daemonize" ,"no"]