#!/bin/bash

set -eu pipefail

sudo apt install -y software-properties-common libfuse2t64
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher -y

echo "AppImageLauncher installed successfully! ✅"
