#!/bin/sh
# investigating script

df -i /mnt/new_disk
cd /mnt/new_disk/new_dir
echo "number of created files:"
ls -l | wc -l

