#!/bin/bash -x

ulimit -c 0
exec linux \
  uml_dir=`pwd` \
  umid=debian_uml \
  root=/dev/root rootfstype=hostfs rootflags=/ \
  mem=1G \
  init=`pwd`/init \
  "eth0=slirp,02:00:00:00:00:01,`which slirp`" \

