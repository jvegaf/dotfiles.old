#!/bin/bash

set -euo pipefail

sudo apt remove -y fd-find

FD_VERSION=$(curl -s "https://api.github.com/repos/sharkdp/fd/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

cd /tmp
curl -Lo fd_amd64.deb "https://github.com/sharkdp/fd/releases/latest/download/fd_${FD_VERSION}_amd64.deb"

sudo dpkg -i ./fd_amd64.deb

fd --version

rm -rf fd_amd64.deb

exit 0
