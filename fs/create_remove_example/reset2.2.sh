#!/bin/sh
# deleting fs script

cd /mnt/new_disk/
rm -rf * 
cd ../
umount /mnt/new_disk
rm /tmp/my_sys_2M.img
rmdir /mnt/new_disk

