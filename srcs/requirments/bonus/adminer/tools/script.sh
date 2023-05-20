mkdir /var/www/html/adminer
cp /root/index.php /var/www/html/adminer/index.php
rm /var/www/html/index.html
exec "$@"
