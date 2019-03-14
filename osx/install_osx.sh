#!/bin/bash

# Install developer tools from Apple
xcode-select --install
# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install all binary applications from Homebrew
bash brew_install.sh
# Install all visual applications from Homebrew using cask
bash brew_cask_install.sh

