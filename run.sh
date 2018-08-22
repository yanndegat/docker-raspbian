#!/bin/sh

PORT_SSH=${PORT_SSH:-22}

if [ ! -f /img/2018-06-27-raspbian-stretch-lite.img ]; then
    cp /2018-06-27-raspbian-stretch-lite.img /img
fi

qemu-system-arm \
    -kernel kernel-qemu-4.9.59-stretch \
    -cpu arm1176 \
    -m 256 \
    -M versatilepb \
    -dtb versatile-pb.dtb \
    -no-reboot \
    -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" \
    -net nic \
    -net user,hostfwd=tcp::${PORT_SSH}-:22 -hda /img/2018-06-27-raspbian-stretch-lite.img \
    -vnc 0.0.0.0:0,to=00,id=default
