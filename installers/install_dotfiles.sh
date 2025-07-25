#!/bin/bash

# Install dependencies
sudo apt -y install stow

# Get script directory
DIR="$(dirname $0)"

# Stow
pushd $DIR/../home
stow .
popd

pushd $DIR/../config
stow .
popd
