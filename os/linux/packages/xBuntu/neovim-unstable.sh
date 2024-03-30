#!/bin/bash

# sudo apt remove -y neovim
# sudo apt autoremove -y

set -euo pipefail

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update && sudo apt install -y neovim

exit 0

