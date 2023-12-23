#!/bin/bash

set -euo pipefail

sudo add-apt-repository ppa:aslatter/ppa -y

sudo apt update

sudo apt install -y alacritty

exit 0
