#!/bin/sh

UID="${UID:-1000}"

cat /etc/passwd | grep "syncthing:x:" > /dev/null && deluser syncthing > /dev/null
adduser -DH -u $UID -h / -s /sbin/nologin syncthing

chown syncthing /var/syncthing
exec su syncthing - -s /bin/sh -c "exec /syncthing/syncthing -home /var/syncthing/config -gui-address 0.0.0.0:8384"
