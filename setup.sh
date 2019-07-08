#!/bin/bash

sh osx/install_osx.sh

rustup install stable
pushd powerline-fonts && ./install.sh && popd
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

sudo cp conf/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

defaults read com.googlecode.iterm2
