#!/bin/bash

# set -euo fails

sudo apt install -y autoconf build-essential git stow tmux tree vim-nox

sudo echo "deb http://ftp.debian.org/debian bullseye-backports main" > /etc/apt/sources.list.d/backports.list
sudo apt update

sudo apt install -y libev-dev libpango1.0-dev libstartup-notification0-dev libxcb-cursor-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-xrm0 libxcb1-dev libxkbcommon-dev libxkbcommon-x11-dev libyajl-dev xcb

cd /usr/local/src
git clone https://github.com/Airblader/i3 i3-gaps
cd i3-gaps

hash=$(git rev-parse --short HEAD)

autoreconf --force --install
mkdir build && cd "$_"
../configure --prefix=/usr/local --sysconfdir=/etc --disable-sanitizers
make PREFIX=/usr/local
make install prefix=/usr/local/stow/i3-gaps-$(hash)

find /usr/local/stow/i3-gaps-$(hash) -type d -exec chmod 755 {} \;
find /usr/local/stow/i3-gaps-$(hash) -type f -exec chmod 644 {} \;
chmod -R 755 /usr/local/stow/i3-gaps-$(hash)/bin

cd /usr/local/stow
stow i3-gaps-$(hash)

sudo apt install -t bullseye-backports feh i3blocks i3lock i3status lightdm sakura suckless-tools xorg
