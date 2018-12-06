# chrooted_openjdk
Install OpenJDK in a chrooted environment on CentOS6

Git clone this repo and change directory into the folder. 
Follow these instructions to get a simple chrooted OpenJDK environment set up. 

1. vagrant up
2. vagrant ssh 
3. sudo chroot /chroot /bin/bash -l
4. /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java -version
