#!/bin/sh
# execute any pre-init scripts, useful for images
# based on this image

for i in /scripts/pre-init.d/*sh
do
        if [ -e "${i}" ]; then
             echo "[i] pre-init.d - processing $i"
             ."${i}"
        fi
done
#set apache as owner/group
if [ "$FIX_OWNERSHIP" != "" ]; then
    chown -R apache:apache /app
fi

# display logs
#tail -F /var/log/apache2/*log

# execute any pre-exec scripts, useful for images
# based on this image
for i in /scripts/pre-exec.d/*sh
do
        if [ -e "${i}" ]; then
             echo "[i] pre-exec.d - processing $i"
             ."${i}"
        fi
done
set -e
# Apache gets grumpy about PID files pre-existing
rm -f /run/apache2/httpd.pid

echo "[i] Starting daemon..."
# run apache httpd daemon
httpd -D FOREGROUND