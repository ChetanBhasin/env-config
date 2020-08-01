#!/bin/bash

# Install Basic OS X Tools
pushd osx
sh install_osx.sh
popd

# Install Rust and the tooling
rustup install stable
sh rust/setup.sh

#Install Powerline
pushd powerline-fonts && ./install.sh && popd

# Setup iTerm 2 configuration
sudo cp conf/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
defaults read com.googlecode.iterm2

# Setup Neovim
sudo mkdir -p ~/.conf/nvim
sudo cp conf/nvim_init.vim ~/.conf/nvim/init.vim

