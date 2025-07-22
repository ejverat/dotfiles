#!/bin/bash

# Install dependencies
sudo apt -y install stow

# Get script directory
DIR="$(dirname $0)"

# Stow
cd $DIR/../home
stow .

cd $DIR/../config
stow .
