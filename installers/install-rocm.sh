#!/bin/sh

pushd /tmp
sudo apt update
sudo apt install -y "linux-headers-$(uname -r)"
sudo apt install -y python3-setuptools python3-wheel libpython3.11
sudo usermod -a -G render,video $LOGNAME # Add the current user to the render and video groups
wget https://repo.radeon.com/amdgpu-install/6.3.1/ubuntu/jammy/amdgpu-install_6.3.60301-1_all.deb
sudo apt install -y ./amdgpu-install_6.3.60301-1_all.deb
sudo apt update
sudo apt install -y amdgpu-dkms rocm
popd
