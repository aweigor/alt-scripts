#!/bin/sh
# reset script for base file execution results

rm info && echo 'base file was deleted'		# base file removing
echo $?						# escaping last operation result code

