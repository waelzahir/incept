echo wordpress
ifconfig | grep inet
echo wordpress
mkdir -p /run/php
touch /run/php/php7.3-fpm.sock
exec "$@"