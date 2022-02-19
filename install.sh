#!/bin/bash


R='\033[31m'  # red
G='\033[32m'  # green
C='\033[36m'  # cyan
W='\033[0m'   # white
Y='\033[33m'  # yellow



if [ -f '/etc/arch-release' ]; then
	sudo pacman -Sy
	sudo pacman -Syu
	sudo pacman -S espeak-ng >/dev/null
	espeak-ng "Installation is in Progress " 1>/dev/null
	sudo pacman -S mono-devel
	sudo pacman -S aspnet-runtime 
	sudo pacman -S dotnet-sdk
	sudo chmod +x scriptcs
	sudo mv scriptcs /bin/
elif [ -f '/etc/fedora-release' ]; then
	sudo dnf update
	sudo dnf install mono-devel
	sudo dnf install nunit nunit-gui
	sudo chmod +x scriptcs
        sudo mv scriptcs /bin/
elif [ -f '/etc/debian_version' ]; then
	sudo apt update && sudo apt upgrade -y
	sudo apt install gnupg ca-certificates
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
	echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
	sudo apt update
	sudo apt install mono-devel
	sudo chmod +x scriptcs
        sudo mv scriptcs /bin/
elif [ -f '/etc/kali-release' ]; then
	sudo apt update && sudo apt upgrade -y
	sudo apt-get install mono-complete
	sudo apt install mono-devel
	sudo chmod +x scriptcs
        sudo mv scriptcs /bin/
elif [ $OSTYPE == 'linux-android' ]; then
	apt update 
	apt upgrade -y	
	apt install mono
	chmod +x scriptcs
        mv scriptcs $PREFIX/bin/
else
	printf " ${R} Sorry couldn't find distro"
	exit
fi


echo -e " ${G} Thanks for using"

echo -e " ${Y} NOTE : Now your mono is installed which is automated for exectution of C#, script named as scriptcs. Now you can execute you file from anywhere, You can use vscode also without any problem"

