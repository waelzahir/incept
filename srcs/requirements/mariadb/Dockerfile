FROM debian:buster

RUN apt update && apt install vim bash net-tools -y

COPY tools /root/

RUN chmod +x /root/maria.sh

CMD ["bash", "-c", "/root/maria.sh"]