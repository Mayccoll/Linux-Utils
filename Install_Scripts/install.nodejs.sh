#!/bin/bash

# Using Ubuntu
# https://github.com/nodesource/distributions

curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt install -y nodejs

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
