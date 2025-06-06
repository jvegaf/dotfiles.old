#!/bin/bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list.d/kali.list
wget -q -O - | sudo apt-key add -
sudo wget https://archive.kali.org/archive-keyring.gpg -O /usr/share/keyrings/kali-archive-keyring.gpg
# wget -qO- https://archive.kali.org/archive-key.asc | sudo tee /etc/apt/trusted.gpg.d/archive-key.asc
sudo apt update && sudo apt install -y aircrack-ng

log::note "Aircrack ng installed ✅"

exit 0
