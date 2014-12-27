#!/usr/bin/env bash

# target specific init.rc (blockdev-symlinks)
cp $ANDROID_BUILD_TOP/device/motorola/edison/init.target.rc $OUT/recovery/root/

#ducati-firmware is needed for kexecd kernel
cp $ANDROID_BUILD_TOP/vendor/motorola/edison/proprietary/etc/firmware/ducati-m3.bin $OUT/recovery/root/etc/firmware/

#kexec-files
cp $ANDROID_BUILD_TOP/device/motorola/edison/kexec/* $OUT/install-files/etc/safestrap/kexec/

sh $ANDROID_BUILD_TOP/bootable/recovery/safestrap/devices/motorola/common-omap4/build-install-kexec.sh
cd $ANDROID_BUILD_TOP/bootable/recovery/safestrap/devices/motorola
cp -fr edison/hijack $OUT/install-files/bin/logwrapper
cp -fr edison/twrp.fstab $OUT/recovery/root/etc/twrp.fstab
cp -fr edison/ss.config $OUT/install-files/etc/safestrap/ss.config
cp -fr edison/ss.config $OUT/APP/ss.config
cp -fr edison/ss.config $OUT/recovery/root/ss.config
cp -fr edison/build-fs.sh $OUT/recovery/root/sbin/
cp -fr edison/init.rc $OUT/recovery/root/
sh $ANDROID_BUILD_TOP/bootable/recovery/safestrap/devices/common/build-install-finish.sh
