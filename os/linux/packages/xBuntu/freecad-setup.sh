#!/bin/bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

APPIMAGE_BASEPATH="$HOME/Applications/"

# Fetch the latest release data
RELEASE_DATA=$(curl -s "https://api.github.com/repos/FreeCAD/FreeCAD/releases/latest")

# Debug: Print the release data
echo "$RELEASE_DATA" | jq .

# Extract the download URL and file name
DOWNLOAD_URL=$(echo "$RELEASE_DATA" | jq -r --arg arch "x86_64" '.assets[] | select(.name endswith(".AppImage") | select(.name contains($arch)) | .browser_download_url')
FILE_NAME=$(echo "$RELEASE_DATA" | jq -r --arg arch "x86_64" '.assets[] | select(.name endswith(".AppImage") | select(.name contains($arch)) | .name')

# Check if the download URL and file name were found
if [ -z "$DOWNLOAD_URL" ] || [ -z "$FILE_NAME" ]; then
  echo "Error: Could not find a suitable AppImage for architecture $ARCH."
  exit 1
fi

log::note "Download URL: ${DOWNLOAD_URL}"
log::note "File name: ${FILE_NAME}"

if [ ! -d "$APPIMAGE_BASEPATH" ]; then
  mkdir -p "$APPIMAGE_BASEPATH"
fi

cd "$APPIMAGE_BASEPATH"
curl -Lo "${FILE_NAME}" "${DOWNLOAD_URL}"

chmod +x "${FILE_NAME}"

log::note "FreeCAD installed ✅"

exit 0
