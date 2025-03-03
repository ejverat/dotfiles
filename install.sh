#!/bin/sh

# add user to sudo group
su -
usermod -aG sudo $USER
logout
exit

# refresh group && install basic software
newgrp sudo
sudo apt -y install git curl lxpolkit expect stow meson fzf bat fd-find flameshot pavucontrol

# cargo / rust
exec ./install-cargo-rust.exp
source ~/.cargo/env
cargo install tree-sitter-cli
cargo install ripgrep

#install NodeJs
sudo curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install nodejs -y

# Stow
stow .

# install latest neovim
pushd /tmp
git clone https://github.com/neovim/neovim.git
pushd neovim
git checkout stable
sudo apt -y build-dep neovim
cpack -G DEB && sudo apt -y install ./build/nvim-linux-*.deb
popd
popd

#install wezterm
pushd /tmp
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update
sudo apt -y install wezterm
popd

#install awesomewm
pushd /tmp
sudo apt -y build-dep awesome
sudo apt -y build-dep awesome-extra
sudo apt -y install libxcb-xfixes0-dev
git clone https://github.com/awesomeWM/awesome.git
pushd awesome
make package
sudo apt install ./build/awesome*.deb
popd
popd

# TMUX
pushd /tmp
sudo apt -y build-dep tmux
git clone https://github.com/tmux/tmux.git
pushd tmux
git checkout tmux-3.5a
sh autogen.sh
./configure
make
sudo make install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
popd
popd

# Blueman
sudo apt install blueman

# Install nerd fonts
exec ./nerdfonts-expect.exp 21

# Install rofi
exec ./install-rofi.sh

# Install graphics ROCm
exec ./install-rocm.sh

# Install graphics ROCm
exec ./install-rocm.sh

# Install teams
exec ./install-teams.sh

# Latex
sudo apt install -y textlive-full textstudio

# zsh
sudo apt install -y zsh
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
