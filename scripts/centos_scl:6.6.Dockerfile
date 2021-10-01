FROM centos_eol:6.6

# 'centos-release-scl' repository provides GCC v.7 (devtoolset-7-gcc-c++)
# It will be available starting with next yum transaction
RUN yum install -y centos-release-scl

# Centos 6 went EOL on 2020.11.30 and yum config became broken. The following shall fix it:
RUN \
  for F in /etc/yum.repos.d/CentOS-SCLo-scl{,-rh}.repo ; do \
    mv $F ${F}.ORIG ; \
    sed \
      -e 's@^mirrorlist=@#mirrorlist=@' \
      -e 's@^# *baseurl=http://mirror.centos.org/centos/6/@baseurl=http://vault.centos.org/6.10/@' \
      < ${F}.ORIG > $F ; \
  done
