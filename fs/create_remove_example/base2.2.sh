#!/bin/sh
# create and fill fs script

truncate -s 2M /tmp/my_sys_2M.img # create dile with size of 2M
mkfs.ext2 /tmp/my_sys_2M.img # create ext2 file system
mkdir /mnt/new_disk # creating mounting point
mount /tmp/my_sys_2M.img /mnt/new_disk # mounting fs
df -Hi /mnt/new_disk # info about fs

# fill out the file system

block_size=$(tune2fs -l /tmp/my_sys_2M.img | grep "Block size" | tr -d -c 0-9)
free_inodes=$(tune2fs -l /tmp/my_sys_2M.img | grep "Free inodes" | tr -d -c 0-9)

mkdir /mnt/new_disk/new_dir
cd /mnt/new_disk/new_dir
i=1
while [ "$i" -lt "$free_inodes" ]; do
	touch /mnt/new_disk/new_dir/file_$i
	dd if=/dev/zero of=/mnt/new_disk/new_dir/file_$i bs=$block_size count=1 1> /dev/null 2>& 1
	((i=i+1))
done
echo $?

