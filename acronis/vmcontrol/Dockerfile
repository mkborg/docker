FROM ubuntu

RUN \
    apt-get update \
    && apt-get install -y python-pip \
    && true
RUN \
    pip3 install -i https://artifactory.corp.acronis.com/api/pypi/global-pypi-prod-virtual/simple vmcontrol \
    && apt-get clean all

# ENTRYPOINT and CMD are two different instructions. If they both
# exist, CMD would be treated as ENTRYPOINT’s parameters.
#
# Default is like the following:
#   ENTRYPOINT ["/bin/sh", "-c"]
#   CMD []

ENTRYPOINT ["/usr/local/bin/vmcontrol"]
CMD ["--help"]
