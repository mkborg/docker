ARCH=$1
FS_FILE=./BusyBox-1.5.0-${ARCH}-root_fs

dd if=/dev/zero of=./${FS_FILE} bs=1048576 count=16
mkfs.ext3 ${FS_FILE}
mkdir tmp
mount -o loop ${FS_FILE} tmp
echo "copy busybox install dir into tmp/"
mkdir tmp/dev
mkdir tmp/sys
mkdir tmp/proc
mkdir tmp/dev/pts
for i in 0 1 2 3 4 5 6 7; do mknod tmp/dev/ubd$i b 98 $[ $i * 16 ]; done
cp -apr /dev/hd* tmp/dev/
cp -apr /dev/sd* tmp/dev/
cp -apr /dev/console tmp/dev/
cp -apr /dev/*ty* tmp/dev/
cp -apr /dev/*vc* tmp/dev/
cp -apr /dev/*null* tmp/dev/
cp -apr /dev/*zero* tmp/dev/
cp -apr /dev/*random* tmp/dev/
cp -apr /dev/*full* tmp/dev/
mkdir -p tmp/etc/init.d
touch tmp/etc/init.d/rcS
chmod +x tmp/etc/init.d/rcS
umount tmp
