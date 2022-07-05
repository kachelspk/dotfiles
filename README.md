
fzf
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get install apt-transport-https -y
sudo add-apt-repository ppa:hluk/copyq -y
sudo apt update
sudo apt install -y git tmux ssh cmus minicom stow  nfs-kernel-server git git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip libssl-dev openssh-server file git net-tools cifs-utils copyq sublime-text uget


