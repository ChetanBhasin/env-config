#!/bin/bash

file=brew_installed

brew update
brew upgrade

cat brew_installed | while read line ; do
    brew install $line
done

brew upgrade
