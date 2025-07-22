#!/bin/bash

echo "Installing cargo and rust"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable

echo "Completed"
