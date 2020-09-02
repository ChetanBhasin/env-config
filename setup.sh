#!/bin/bash

set -o vi 

# Install Basic OS X Tools
pushd osx
sh install_osx.sh
popd

# Setup iTerm 2 configuration
mkdir -p ~/Library/Preferences/
cp conf/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
defaults read com.googlecode.iterm2

# Setup Neovim
mkdir -p ~/.conf/nvim
cp conf/nvim_init.vim ~/.conf/nvim/init.vim

# Setup Hammerspoon
mkdir -p ~/.hammerspoon
cp conf/hammerspoon.lua ~/.hammerspoon/init.lua

# Install Rust and the tooling
#sh rust/setup.sh


