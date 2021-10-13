ifconfig lo 127.0.0.1/8 up
#ifconfig eth0 10.2.0.15 up
ifconfig eth0 10.0.2.15 up
#ip link set eth0 up
#busybox udhcpc -i eth0
#route add default eth0
route add default gw 10.0.2.2
