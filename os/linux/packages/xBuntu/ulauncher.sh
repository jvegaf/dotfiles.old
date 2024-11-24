#!/bin/bash

set -eu pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

log::note "Installing Ulauncher 🚀 ..."

sudo add-apt-repository universe -y && \
    sudo add-apt-repository ppa:agornostal/ulauncher -y && \
    sudo apt update && \
    sudo apt install ulauncher -y

log::note "Ulauncher installed ✅"

exit 0
