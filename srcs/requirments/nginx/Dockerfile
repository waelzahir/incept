FROM debian:buster

RUN apt update
RUN apt install net-tools nginx bash -y

COPY tools/script.sh /root
RUN chmod +x /root/script.sh
EXPOSE 80
ENTRYPOINT ["/bin/bash", "root/script.sh"]
CMD ["nginx", "-g", "daemon off;"]
