#!/bin/sh
# groups and users create script

# check number of arguments
[[ $# -eq 5 ]] || { echo i>&2 "base3.2.sh { group1, group2, user1, user2, user3 }"; exit 1; }

groupadd $1 # create groups
groupadd $2
adduser $3 # create users
adduser $4
adduser $5
gpasswd -a $3 $1 # добавляем пользователей в группы gpasswd -a user2 group1
gpasswd -a $4 $1
gpasswd -a $4 $2
gpasswd -a $5 $2
for i in $(seq 3 5)
do # инфо о пользователях и группах
     echo "пользователь ${!i}"
     id ${!i}
done
mkdir /srv/dir_$1 /srv/dir_$2 # создаем каталоги 
chgrp $1 /srv/dir_$1 # "отдаем" каталоги соотв. группам 
chgrp $2 /srv/dir_$2
chmod 2775 /srv/dir_$1 /srv/dir_$2 # права на запись в каталоги
ls -la /srv

