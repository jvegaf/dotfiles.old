#!/bin/bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

sudo apt-get -y install apt-transport-https
cd /tmp

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update && sudo apt-get -y install sublime-text

log::note "Sublime Text 4 installed ✅"

exit 0
