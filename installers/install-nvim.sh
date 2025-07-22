#!/bin/bash
# install latest neovim
pushd /tmp
git clone https://github.com/neovim/neovim.git
pushd neovim
git checkout stable
sudo apt -y build-dep neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
pushd build
cpack -G DEB && sudo apt -y install ./nvim-linux-*.deb
popd
popd
popd

sudo echo "EDITOR=/usr/bin/nvim" >/etc/environment
