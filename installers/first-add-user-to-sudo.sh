#!/bin/bash

# add user to sudo group
echo "Type root password:"
su -
usermod -aG sudo $USER
logout
exit

echo "run: newgrp sudo"
