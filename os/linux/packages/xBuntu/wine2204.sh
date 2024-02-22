#!/bin/bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

cd /tmp
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ jammy main'
sudo apt update
sudo apt install -y --install-recommends winehq-staging

log::note "Wine installed ✅"

exit 0
