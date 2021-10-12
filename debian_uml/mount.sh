mount -o remount,rw /
mount -t proc proc /proc
mount -t sysfs sys /sys
mount --bind /usr/lib/uml/modules /lib/modules
modprobe loop
