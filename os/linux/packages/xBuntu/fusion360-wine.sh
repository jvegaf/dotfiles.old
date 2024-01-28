#!/bin/bash

set -euo pipefail

sudo apt-get -y install yad

mkdir -p "$HOME/.fusion360/bin" && cd "$HOME/.fusion360/bin" && wget -N https://raw.githubusercontent.com/cryinkfly/Autodesk-Fusion-360-for-Linux/main/files/builds/stable-branch/bin/install.sh && chmod +x install.sh && ./install.sh


exit 0
