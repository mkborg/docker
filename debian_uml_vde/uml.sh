#!/bin/bash -x

ulimit -c 0
exec linux \
  uml_dir=`pwd` \
  umid=debian_uml_vde \
  root=/dev/root rootfstype=hostfs rootflags=/ \
  mem=1G \
  ubd0=BusyBox-1.21.1-amd64-root_fs_cow,BusyBox-1.21.1-amd64-root_fs \
  init=`pwd`/init \
  "eth0=vde,vde://`pwd`/mysw" \

#  "eth0=vde,slirp://`pwd`/vde.xxx" \
#  "eth0=vde,slirp://" \
#  init=`pwd`/init \
#  "hostfs=`pwd`,`pwd`" \
#  "hostfs=/tmp" \
#  root=/dev/ubda \

# 'hostfs=/path' results in '/path' prepended to all 'hostfs' mount paths.
# For example with 'hostfs=/home'
#   mount -t hostfs none /home
# will mount hosts's '/home' to UML's '/home'
#   mount -t hostfs none /home/user -o /user
# will mount hosts's '/home/user' to UML's '/home/user'
