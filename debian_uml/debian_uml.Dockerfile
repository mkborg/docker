FROM debian

RUN \
  apt-get update \
  && \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      user-mode-linux \
      \
      slirp \
      uml-utilities \
      \
      iproute2 \
      kmod \
      net-tools \
      \
      bind9-dnsutils \
      busybox-static \
      iputils-ping \
      procps \
      reiserfsprogs \
      traceroute \
      wget \
      xz-utils \
  && apt-get clean all
