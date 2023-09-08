#!/bin/bash

set -euo pipefail

WEZTERM_VERSION=$(curl -s "https://api.github.com/repos/wez/wezterm/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/')

echo "downloading 🔗 wezterm version: ${WEZTERM_VERSION}"

curl -Lo wezterm.deb "https://github.com/wez/wezterm/releases/download/${WEZTERM_VERSION}/wezterm-${WEZTERM_VERSION}.Ubuntu22.04.deb"

sudo dpkg -i wezterm.deb

rm -rf wezterm.deb

echo "WezTerm installed ✓"

exit 0
