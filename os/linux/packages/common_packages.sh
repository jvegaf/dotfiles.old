#!/bin/bash

sudo apt -y install software-properties-common

sudo apt update
sudo apt upgrade -y
sudo apt-get -y install tldr python3-pip vlc htop screenfetch wget docker.io docker-compose vim simplescreenrecorder rofi xclip xdotool grep coreutils locate transmission openjdk-17-jdk 


sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
sudo usermod -aG dialout $USER

