#!/bin/bash

set -euo pipefail

# Activate the multilib repository ...
# echo "Enabling the multilib repository ..."
# echo "[multilib]" | sudo tee -a /etc/pacman.conf
# echo "Include = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf
#
sudo pacman -Sy --needed wine wine-mono wine_gecko winetricks p7zip curl cabextract samba ppp yad

# mkdir -p "$HOME/.fusion360/bin" && cd "$HOME/.fusion360/bin" && wget -N https://raw.githubusercontent.com/cryinkfly/Autodesk-Fusion-360-for-Linux/main/files/builds/stable-branch/bin/install.sh && chmod +x install.sh && ./install.sh

exit 0
