from debian:buster

run apt update
run apt -y install  php

copy tools/entry.sh /
copy conf/index.html /var/www/html/

ENTRYPOINT ["bash", "entry.sh"]
CMD ["php", "-S", "0.0.0.0:80" , "-t","/var/www/html/"]