#!/bin/bash
help () {
	echo "KittyDot Installer Usage: ./install.sh <operation> (option)"
	echo ""
	echo "Operations"
	echo " install : Installs the KittyDot config"
	echo " backup  : Copys the current configs to (Config File).backup for safe keeping"
	echo " restore : Restores the config files named (Config File).backup that the installer backed up"
	EXIT=1
}

install () {
	for file in $(find config -not -type d)
	do
		echo ./$file \> '~/'.$file
		cp $file ~/.$file
	done
	echo "Installing Fonts"
	cp -r ./fonts ~/.fonts
}

backup () {
	for file in $(find config -not -type d)
	do
		echo '~/'.$file \> '~/'.$file.backup
		cp ~/.$file ~/.$file.backup
	done
}

restore () {
	for file in $(find config -not -type d)
	do
		echo '~/'.$file.backup \> '~/'.$file
		cp ~/.$file.backup ~/.$file
	done
}

if [ $# -lt 1 ]
then
	help
elif [ $1 = 'install' ]
then
	echo "Installing the KittyDot Configs..."
	install
elif [ $1 = 'backup' ]
then
	echo "Backing up configs..."
	backup
elif [ $1 = 'restore' ]
then
	echo "Restoring configs..."
	restore
else
	help
fi
