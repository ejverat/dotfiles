#!/bin/bash
pushd /tmp
git clone https://github.com/davatorium/rofi.git
pushd rofi
git checkout 1.7.8
git submodule update --init
sudo apt -y build-dep rofi-dev
meson setup build
ninja -C build
sudo ninja -C build install
popd
popd
