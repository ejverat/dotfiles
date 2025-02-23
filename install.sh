#!/bin/sh

# add user to sudo group
su -
usermod -aG sudo $USER
logout
exit

# refresh group && install basic software
newgrp sudo
sudo apt -y install git curl

# install latest neovim
cd /tmp
git clone https://github.com/neovim/neovim.git
pushd neovim
git checkout stable
sudo apt -y build-dep neovim
cpack -G DEB && sudo apt -y install ./build/nvim-linux-*.deb
popd

#install wezterm
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update
sudo apt -y install wezterm

#install awesomewm
sudo apt -y build-dep awesome
sudo apt -y build-dep awesome-extra
sudo apt -y install libxcb-xfixes0-dev
git clone https://github.com/awesomeWM/awesome.git
pushd awesome
make package
sudo apt install ./build/awesome*.deb
popd
