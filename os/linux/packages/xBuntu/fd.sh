#!/bin/bash

set -euo pipefail

FD_VERSION=$(curl -s "https://api.github.com/repos/sharkdp/fd/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

curl -Lo fd.deb "https://github.com/sharkdp/fd/releases/latest/download/fd_${FD_VERSION}_amd64.deb"

sudo apt install -y ./fd.deb

fd --version

rm -rf fd.deb

exit 0
