#!/bin/bash

sudo yum update -y
sudo yum install java-1.8.0-openjdk.x86_64 -y

sudo mkdir -p /chroot
sudo mkdir -p /chroot/bin
sudo mkdir -p /chroot/lib
sudo mkdir -p /chroot/lib64
sudo mkdir -p /chroot/dev
sudo mkdir -p /chroot/proc
sudo mkdir -p /chroot/usr/bin
sudo mkdir -p /chroot/usr/lib64
sudo mkdir -p /chroot/etc/alternatives
sudo mkdir -p /chroot/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/

# Copy over Java binary
sudo cp -pr /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java /chroot/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/
# TODO:
# Automate symlinking of Java files
#
#sudo ln -s /chroot/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java /chroot/etc/alternatives/java
#sudo ln -s /chroot/etc/alternatives/java /chroot/usr/bin/java

sudo mkdir -p /chroot/usr/lib/jvm-common
sudo mkdir -p /chroot/usr/lib/jvm-exports
sudo mkdir -p /chroot/usr/lib/jvm-private

# Copy crap to /lib64
sudo cp -pr /lib64/ld-2.12.so /lib64/ld-linux-x86-64.so.2 /lib64/libacl.so.1 /lib64/libacl.so.1.1.0 /lib64/libattr.so.1 /lib64/libattr.so.1.1.0 /lib64/libc-2.12.so /lib64/libc.so.6 /lib64/libcap.so.2 /lib64/libcap.so.2.16 /lib64/libdl-2.12.so /lib64/libdl.so.2 /lib64/libgcc_s-4.4.7-20120601.so.1 /lib64/libgcc_s.so.1 /lib64/libm-2.12.so /lib64/libm.so.6 /lib64/libnsl-2.12.so /lib64/libnsl.so.1 /lib64/libnss_dns-2.12.so /lib64/libnss_dns.so.2 /lib64/libnss_files-2.12.so /lib64/libnss_files.so.2 /lib64/libpthread-2.12.so /lib64/libpthread.so.0 /lib64/libresolv-2.12.so /lib64/libresolv.so.2 /lib64/librt-2.12.so /lib64/librt.so.1 /lib64/libselinux.so.1 /lib64/libtinfo.so.5 /lib64/libtinfo.so.5.7 /lib64/libz.so.1 /lib64/libz.so.1.2.3 /chroot/lib64/

# Copy crap to /usr/lib64
sudo cp -pr /usr/lib64/libstdc++.so.6 /usr/lib64/libstdc++.so.6.0.13 /chroot/usr/lib64/

# Copy some binaries for now to /chroot/bin from /bin
sudo cp -pr /bin/bash /bin/cat /bin/cp /bin/find /bin/ln /bin/ls /bin/rm /chroot/bin/
sudo cp -pr /usr/bin/ldd /chroot/usr/bin/

sudo mount --bind /proc /chroot/proc
sudo mount --bind /dev /chroot/dev
sudo mount --bind /usr/lib/jvm /chroot/usr/lib/jvm
sudo mount --bind /usr/lib/jvm-private /chroot/usr/lib/jvm-private
sudo mount --bind /usr/lib/jvm-exports /chroot/usr/lib/jvm-exports
sudo mount --bind /usr/lib/jvm-commmon /chroot/usr/lib/jvm-common
