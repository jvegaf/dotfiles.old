#!/bin/bash

set -euo pipefail

cd /tmp
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo "yay installed successfully! ✔️ "
