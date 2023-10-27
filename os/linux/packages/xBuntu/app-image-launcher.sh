#!/bin/bash

set -euo pipefail

sudo apt install -y software-properties-common
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher -y

echo "AppImageLauncher installed successfully! ✅"
