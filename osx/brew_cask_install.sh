#!/bin/bash

file=brew_cask_installed

brew update
brew upgrade

cat brew_installed | while read line ; do
    brew cask install $line
done

brew upgrade
