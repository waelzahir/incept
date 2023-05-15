FROM debian:buster

RUN apt update
RUN apt install mariadb-server -y

COPY tools/script.sh /root
RUN chmod +x /root/script.sh
CMD "/bin/sh" "-c" "/root/script.sh"