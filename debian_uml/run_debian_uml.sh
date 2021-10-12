#!/bin/bash -e

SCRIPT_DIR="$(dirname $0)"
SCRIPT_DIR="$(readlink -m ${SCRIPT_DIR})"


MOUNT+=" /dev/shm"

#ROOTFS_DIR="$(readlink -m ROOTFS)"
#echo "ROOTFS_DIR='${ROOTFS_DIR}'"
#MOUNT+=" ${ROOTFS_DIR}"

echo "MOUNT='${MOUNT}'"
export MOUNT


#MOUNT_OPTIONS+=" -v ${SCRIPT_DIR}/init:/sbin/init"
#MOUNT_OPTIONS+=" -v ${SCRIPT_DIR}/modules:/lib/modules"

#echo "MOUNT_OPTIONS='${MOUNT_OPTIONS}'"
#export MOUNT_OPTIONS


#MOUNT_OPTIONS_EXTRA+=" -v ${SCRIPT_DIR}/init:/sbin/init"
MOUNT_OPTIONS_EXTRA+=" -v ${SCRIPT_DIR}/modules:/lib/modules"

echo "MOUNT_OPTIONS_EXTRA='${MOUNT_OPTIONS_EXTRA}'"
export MOUNT_OPTIONS_EXTRA


#DOCKER_OPTIONS+=" --cap-add NET_ADMIN"
#DOCKER_OPTIONS+=" --net=host "

#echo "DOCKER_OPTIONS='${DOCKER_OPTIONS}'"
#export DOCKER_OPTIONS


exec ${SCRIPT_DIR}/run.debian_uml.sh "$@"
