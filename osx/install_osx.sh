#!/bin/bash

# Install developer tools from Apple
xcode-select --install
# Install homebrew if not installed, otherwise update
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi
# Install all binary applications from Homebrew
bash brew_install.sh
# Install all visual applications from Homebrew using cask
bash brew_cask_install.sh

