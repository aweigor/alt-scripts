#!/bin/sh
# removing users and groups script

# check number of arguments
[[ $# -eq 5 ]] || { echo i>&2 "reset3.2.sh { group1, group2, user1, user2, user3 }"; exit 1; }

rm -rf /srv/dir_$1 /srv/dir_$2
userdel -r $3
userdel -r $4
userdel -r $5
groupdel $1
groupdel $2
echo $?

