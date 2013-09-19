#!/sbin/bbx sh
# By: Hashcode
# Last Editted: 09/11/2013

# system/userdata/cache
IMAGE_NAME=`echo '${1}' | tr '[a-z]' '[A-Z]'`
LOOP_DEV=${2}
ROMSLOT_NAME=${3}

BLOCK_DIR=/dev/block
BLOCK_system=mmcblk0p16
BLOCK_userdata=mmcblk0p29
BLOCK_cache=mmcblk0p18
BLOCK_boot=mmcblk0p20

eval CURRENT_BLOCK=\$BLOCK_${IMAGE_NAME}

SS_MNT=/ss
SS_DIR=$SS_MNT/safestrap

rm $BLOCK_DIR/$CURRENT_BLOCK
ln -s $BLOCK_DIR/loop$LOOP_DEV $BLOCK_DIR/$CURRENT_BLOCK
mke2fs -T ext4 $BLOCK_DIR/loop$LOOP_DEV
