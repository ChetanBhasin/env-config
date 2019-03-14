#!/bin/bash

brew update
brew upgrade

awk 'NR==FNR{a[$0];next} !($0 in a)' `brew cask list | echo` brew_cask_installed > install.tmp

cat install.tmp | while read line ; do
    brew cask install $line
done

rm *.tmp

brew upgrade
