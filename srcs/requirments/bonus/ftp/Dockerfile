FROM debian:buster

RUN apt update
RUN apt install bash vsftpd -y
COPY conf/ /root
COPY tools/ /root

ENTRYPOINT ["bash","/root/script.sh"]
CMD ["vsftpd", "/root/vsftpd.conf"]