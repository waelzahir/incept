FROM debian:buster

RUN apt update && apt install vim bash net-tools -y
COPY conf /root/conf
RUN chmod +x /root/conf/scriptwp.sh
CMD ["bash", "-c", "/root/conf/scriptwp.sh"]