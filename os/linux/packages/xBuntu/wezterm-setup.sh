#!/bin/bash

# set -euo pipefail

# WEZTERM_VERSION=$(curl -s "https://api.github.com/repos/wez/wezterm/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/')
#
# echo "downloading 🔗 wezterm version: ${WEZTERM_VERSION}"
#
# curl -Lo wezterm.deb "https://github.com/wez/wezterm/releases/download/${WEZTERM_VERSION}/wezterm-${WEZTERM_VERSION}.Ubuntu22.04.deb"
#
# sudo dpkg -i wezterm.deb
#
# rm -rf wezterm.deb

curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

sudo apt update
sudo apt install -y wezterm

echo "WezTerm installed ✓"

exit 0
