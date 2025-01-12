#!/bin/env bash

# set -eu pipefail

echo "Installing Cura"

CURA_VERSION=$(curl -s "https://api.github.com/repos/Ultimaker/Cura/releases/latest" | jq -r '.tag_name')
DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/Ultimaker/Cura/releases/latest" | jq -r '.assets[] | select(.name | endswith(".AppImage")) | .browser_download_url')

echo "Cura version: ${CURA_VERSION}"
echo "Download URL: ${DOWNLOAD_URL}"

cd "$HOME"/Downloads || exit

curl -Lo UltiMaker-Cura-"${CURA_VERSION}"-linux-X64.AppImage "${DOWNLOAD_URL}"

exit 0
