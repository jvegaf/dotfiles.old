#!/bin/bash

sudo rm /etc/apt/preferences.d/nosnap.pref

sudo apt-get -y install snapd

export PATH="$PATH:/snap/bin"

sudo snap install code --classic
sudo snap install intellij-idea-ultimate --classic
