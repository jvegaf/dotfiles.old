!#!/bin/bash

mkdir ~/.opt
cd ~/.opt
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

sudo paru -Sy
paru -S --noconfirm --needed - < allpkglist.txt

echo "all packages installed "
