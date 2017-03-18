#!/bin/bash
if [ "$(id -u)" != "0" ]; then
  exec sudo "$0" "$@" 
fi
mkdir -p /var/run/moin
#Chown the dir with the user:group run in /srv/moin/wiki/uwsgi.ini
chown moin:nginx /var/run/moin
#Add exec/write to other, because otherwise uwsgi cannot make the socket file for
#some stupid reason
chmod 664 /var/run/moin
#Run an echo so this script always returns a successful execution value (0)
echo "Failure is not an option."
exit 0
