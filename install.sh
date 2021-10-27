#!/bin/bash
if [ $# -lt 1 ]
then
	echo "KittyDot Installer Usage: ./install.sh <operation> (option)"
	echo ""
	echo "Operations"
	echo " install : Installs the KittyDot config"
	echo " backup  : Copys the current configs to (Config File).backup for safe keeping"
	echo " restore : Restores the config files named (Config File).backup that the installer backed up"
	EXIT=1
fi

if [ $1 = install ]
then
	echo "Installing the KittyDot Configs..."
	for file in $(find config -not -type d)
	do
		echo $file
		cp $file ~/.$file
	done
fi

if [ $1 = backup ]
then
	echo "Backing up configs..."
	for file in $(find config -not -type d)
	do
		echo $file
		cp ~/.$file ~/.$file.backup
	done
fi

if [ $1 = restore ]
then
	echo "Backing up configs..."
	for file in $(find config -not -type d)
	do
		echo $file
		cp ~/.$file.backup ~/.$file
	done
fi
