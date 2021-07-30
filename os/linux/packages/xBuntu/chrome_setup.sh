#!/bin/bash
chrome
wget https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb
sudo apt install -y ./google-chrome-unstable_current_amd64.deb
rm -rf google-chrome-unstable_current_amd64.deb
