#!/bin/sh
# base file script
# creates file with some text

touch info			# creates file
echo "Igor Novitski" > info	# writes my name into file
date >> info			# writes curret date into next line
echo "date" >> info		# writes date word into next line
echo $?

