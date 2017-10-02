#!/bin/bash

#exit on error
set -e

#probably you would want to change it to high capacity drive
ROOTFS=./

#you would probably need to change IP
JETSON_IP=10.0.0.28
JETSON_USERNAME=ubuntu

mkdir -p "$ROOTFS"
sudo rsync -e ssh -avz "$JETSON_USERNAME"@"$JETSON_IP":/usr/include "$ROOTFS"/.
sudo rsync -e ssh -avz "$JETSON_USERNAME"@"$JETSON_IP":/usr/lib "$ROOTFS"/.


#fix symlinks - from absolute to relative

cd $ROOTFS/usr/lib/aarch64-linux-gnu
find . -maxdepth 1 -type l | while read i;
do qualifies=$(readlink $i | grep '^\(/usr\)\?/lib')
   if [ -n "$qualifies" ]; then
       newPath=$(readlink $i | grep '^\(/usr\)\?/lib' | xargs echo $ROOTFS | sed -e s/\\s//g)
       echo $i
       echo $newPath;
       rm $i;
       ln -s $newPath $i;
   fi
done
