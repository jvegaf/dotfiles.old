#!/bin/bash

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo apt install ./gitkraken-amd64.deb -y 
rm gitkraken-amd64.deb

echo "GitKraken installed ✓"
