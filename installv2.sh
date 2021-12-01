#!/bin/bash

#BS Dots installer v2
#Bryce Schuman
#Nov 2021

config_path=./bsconf

source $config_path

#help doc function
help () {
	echo "$dotname Installer Usage: ./install.sh <operation> (option)"
	echo ""
	echo "Operations"
	echo " install : Installs the $dotname config"
	echo " backup  : Copys the files in ~/.config to (Config File).backup for safe keeping"
	echo " restore : Restores the files in ~/.config named (Config File).backup to their old name"
	EXIT=1
}

#system config install function
systemInstall() {
	echo "--- INSTALLING SYSTEM CONFIGS ---"
	if [ -d ./dots/system/etc ]
	then
		echo "Installing system configs"
		cp --backup -r ./dots/system/etc/* /etc
	fi
	if [ -d ./dots/system/fonts ]
	then
		echo "Installing system fonts"
		cp --backup -r ./dots/system/fonts/* /usr/share/fonts
	fi
	if [ -d ./dots/system/themes ]
	then
		echo "Installing system themes"
		cp --backup -r ./dots/system/themes/* /usr/share/themes
	fi
	if [ -d ./dots/system/icons ]
	then
		echo "Installing system icons"
		cp --backup -r ./dots/system/icons/* /usr/share/icons
	fi
}

#install function
install () {
	echo "--- Starting $dotname install ---"
	if [ -d ./dots/config ]
	then
		echo "Installing user configs"
		cp --backup -r ./dots/config/* ~/.config
	fi
	if [ -d ./dots/fonts ]
	then
		echo "Installing user fonts"
		cp --backup -r ./dots/fonts/* ~/.fonts
	fi
	if [ -d ./dots/themes ]
	then
		echo "Installing user themes"
		cp --backup -r ./dots/themes/* ~/.themes
	fi
	if [ -d ./dots/icons ]
	then
		echo "Installing user icons"
		cp --backup -r ./dots/icons/* ~/.icons
	fi

	#check for system configs
	if [ -d ./dots/system ]
	then
		echo "---WARNING---"
		echo "Depending on your setup, this could lead to a broken system."
		read -p "Do you wish to install system configs? [yN]:" -n 1 -r
		echo ""
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			sudo bash -c "$(declare -f systemInstall); systemInstall"
		fi
	fi
}

backup () {
	echo "Backing up configs..."
	for file in $(find config -not -type d)
	do
		echo '~/'.$file \> '~/'.$file.backup
		cp ~/.$file ~/.$file.backup
	done
}

restore () {
	echo "Restoring configs..."
	for file in $(find config -not -type d)
	do
		echo '~/'.$file.backup \> '~/'.$file
		cp ~/.$file.backup ~/.$file
	done
}

#display cool logo
echo ""
cat ./logo
echo ""

if [ $# -lt 1 ]
then
	help
elif [ $1 = 'install' ]
then
	install
elif [ $1 = 'backup' ]
then
	backup
elif [ $1 = 'restore' ]
then
	restore
else
	help
fi
