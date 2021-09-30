#!/bin/bash -eu

if [[ $# -lt 1 ]] ; then
  echo >&2 "\$#='$#'"
  echo >&2 "Usage: $0 docker_image_nme..."
  exit 1
fi

for NAME in "$@" ; do
  echo "NAME='${NAME}'"
  CONTAINER_ID="$(docker create "${NAME})"
  docker export "${CONTAINER_ID}" > "${NAME}.tar"
  docker rm "${CONTAINER_ID}"
done
