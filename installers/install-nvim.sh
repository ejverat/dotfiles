#!/bin/bash
# install latest neovim
echo "NEOVIM"

echo "Cloning and choosing latest stable..."

pushd /tmp
git clone https://github.com/neovim/neovim.git
pushd neovim
git checkout stable

echo "Installing dependencies..."
sudo apt -y build-dep neovim

echo "Building..."
make CMAKE_BUILD_TYPE=RelWithDebInfo

echo "Generating .deb's and installing..."
pushd build
cpack -G DEB && sudo apt -y install ./nvim-linux-*.deb

popd
popd
popd

sudo echo "EDITOR=/usr/bin/nvim" >/etc/environment

echo "Completed!"
