mount -t proc proc /proc
mount -t sysfs sys /sys
# 'remount,rw /' fails if '/proc' is not mounted
mount -o remount,rw /
mount -t  hostfs `pwd` `pwd`
mount --bind /usr/lib/uml/modules /lib/modules
#modprobe loop
