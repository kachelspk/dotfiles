#! /bin/bash

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo add-apt-repository ppa:hluk/copyq -y
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update -qq

sudo apt-get install -y gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip software-properties-common tmux minicom git cmus meld stow exuberant-ctags openssh-server samba nfs-kernel-server neovim 


sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/snowdream/51-android/master/51-android.rules
sudo chmod a+r /etc/udev/rules.d/51-android.rules
sudo echo "SUBSYSTEM=="usb", ATTR{idVendor}=="05c6", MODE="0666", GROUP="plugdev"" >> /etc/udev/rules.d/51-android.rules
sudo echo "SUBSYSTEM=="usb", ATTR{idVendor}=="", MODE="0666", GROUP="plugdev"" >> /etc/udev/rules.d/51-android.rules
sudo service udev restart

