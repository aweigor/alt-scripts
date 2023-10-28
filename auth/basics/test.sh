#!/bin/sh
# check user rights script

# check number of arguments
[[ $# -eq 5 ]] || { echo i>&2 "test3.2.sh { group1, group2, user1, user2, user3 }"; exit 1; }


# USER2
cstring=''

cstring+='cd /srv/dir_'
cstring+=$1
cstring+='
	touch file_u2d1
	whoami && echo "successfully created file in catalog " && pwd
	cd /srv/dir_'
cstring+=$2
cstring+='
        touch file_u2d2
        whoami && echo "successfully created file in catalog " && pwd
'

su -l $4 -c "$cstring"

# USER1
cstring=''
cstring+='cd /srv/dir_'
cstring+=$1
cstring+='/
	whoami && echo "successfully accessed file in catalog " && pwd
	cp file_u2d1 file_u1d1
	echo $?
        cd /srv/dir_'
cstring+=$2
cstring+='
        whoami && echo "successfully accessed file in catalog " && pwd
	cp file_u2d2 file_u3d2
        echo $?
'


su -l $3 -c "$cstring"

# USER3
cstring=''
cstring+='cd /srv/dir_'
cstring+=$1
cstring+='/
        whoami && echo "successfully accessed file in catalog " && pwd
        cp file_u2d1 file_u1d1
        echo $?
        cd /srv/dir_'
cstring+=$2
cstring+='
        whoami && echo "successfully accessed file in catalog " && pwd
        cp file_u2d2 file_u3d2
        echo $?
'

su -l $5 -c "$cstring"

