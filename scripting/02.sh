#!/bin/bash
RED='\033[31m'
NC='\033[0m'
LBLUE='\033[104m'
who | awk '{print $1}'
read -p "Enter user to delete from the list: " USER

# Ask user whether to force delete files and homedir
echo "\033[31;7mWarning\033[0m: The following user \"${LBLUE}$USER${NC}\" will be stopped from session and be deleted"
while true; do
	read -p "Would you like to force delete files and homedir (y/n)?
	q to quit: " ynq
	case $ynq in
		[Yy]* ) skill -KILL -u $USER; userdel -r -f $USER; break;;
		[Nn]* ) skill -KILL -u $USER; userdel $USER; break;;
		[Qq]* ) break;;
		* ) echo "Please answer y, n, or q...";;
	esac
done
echo "Program will now exit"
