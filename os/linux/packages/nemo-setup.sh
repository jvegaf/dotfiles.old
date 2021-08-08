#!/bin/bash

sudo apt-get update
sudo apt-get install -y nemo nemo-fileroller

wget http://packages.linuxmint.com/pool/backport/n/nemo-preview/nemo-preview_4.6.0+ulyana_amd64.deb
wget http://packages.linuxmint.com/pool/backport/x/xreader/gir1.2-xreader_2.8.3+ulyssa_amd64.deb
wget http://packages.linuxmint.com/pool/backport/x/xreader/libxreaderview3_2.8.3+ulyssa_amd64.deb
wget http://packages.linuxmint.com/pool/backport/x/xreader/libxreaderdocument3_2.8.3+ulyssa_amd64.deb

sudo apt-get install -y ./gir1.2-xreader_2.8.3+ulyssa_amd64.deb ./libxreaderdocument3_2.8.3+ulyssa_amd64.deb ./libxreaderview3_2.8.3+ulyssa_amd64.deb ./nemo-preview_4.6.0+ulyana_amd64.deb

sudo apt-get install -y gir1.2-gtksource-3.0

rm -rf *.deb

sudo apt-get remove thunar -y

sudo apt-get autoremove --purge -y

