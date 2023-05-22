mkdir -p ftpdata/public
mkdir -p /var/run/vsftpd/empty
chown nobody:nogroup ftpdata

exec "$@"