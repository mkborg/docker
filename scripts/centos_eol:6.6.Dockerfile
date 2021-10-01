FROM centos:6.6

# Centos 6 went EOL on 2020.11.30 and yum config became broken. The following shall fix it:
RUN \
  for F in /etc/yum.repos.d/CentOS-Base.repo ; do \
    mv $F ${F}.ORIG ; \
    sed \
      -e 's@^mirrorlist=@#mirrorlist=@' \
      -e 's@^#baseurl=http://mirror.centos.org@baseurl=http://vault.centos.org@' \
      < ${F}.ORIG > $F ; \
  done
