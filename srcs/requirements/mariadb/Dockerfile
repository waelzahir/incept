FROM debian:buster

RUN apt update && apt install vim bash net-tools -y

COPY tools /root/

RUN chmod +x /root/maria.sh
EXPOSE 3306
CMD ["bash", "-c", "/root/maria.sh"]