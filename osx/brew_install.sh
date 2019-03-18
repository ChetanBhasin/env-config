#!/bin/bash

awk 'NR==FNR{a[$0];next} !($0 in a)' `brew list | echo` brew_installed > install.tmp

cat install | while read line ; do
    brew install $line
done

rm *.tmp

