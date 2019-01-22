#!/bin/sh

function term_handler {
  echo "exiting now"
  fuse_unmount
  exit 0
}

function fuse_unmount {
  umount -l /mnt
}

if [ -z "${URL}" ]; then
  echo "No URL specified!"
fi
if [ -z "${USER}" ]; then
  echo "No username specified"
fi
if [ -z "${PASSWORD}" ]; then
  echo "No password specified"
fi
if [ -z "${OPTIONS}" ]; then
  OPTIONS="uid=$PUID,gid=$PGID"
else
  OPTIONS="uid=$PUID,gid=$PGID,$Options"
fi

echo "$URL $USER $PASSWORD" >> /etc/davfs2/secrets

trap term_handler SIGHUP SIGINT SIGTERM

mount -t davfs $URL /mnt -o $OPTIONS

while true
do
  sleep 1
done

exit 144
