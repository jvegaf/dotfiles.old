#!/bin/bash

sudo apt -y install software-properties-common

sudo apt update
sudo apt upgrade -y
sudo apt-get -y install tldr python3-pip vlc build-essential htop screenfetch wget docker.io docker-compose vim simplescreenrecorder rofi xclip xdotool grep coreutils locate

wget -q -O - https://download.bell-sw.com/pki/GPG-KEY-bellsoft | sudo apt-key add -
echo "deb [arch=amd64] https://apt.bell-sw.com/ stable main" | sudo tee /etc/apt/sources.list.d/bellsoft.list

sudo apt-get update
sudo apt-get install -y bellsoft-java17 gradle

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
sudo usermod -aG dialout $USER

