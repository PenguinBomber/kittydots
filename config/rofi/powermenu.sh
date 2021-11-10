#!/bin/bash

echo -en "\0prompt\x1f$ROFI_RETV\n"
if [ $ROFI_RETV == 1 ]
then
	if [ "$1" == "Lock" ]
	then
		dm-tool lock
	elif [ "$1" == "Logout" ]
	then
		bspc quit
	elif [ "$1" == "Shutdown" ]
	then
		sudo openrc-shutdown --poweroff now
	elif [ "$1" == "Reboot" ]
	then
		sudo openrc-shutdown --reboot now
	fi
	exit
fi
echo "Logout"
echo "Lock"
echo "Shutdown"
echo "Reboot"
