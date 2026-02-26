#!/bin/bash

set -euo pipefail

sudo apt install -y ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick
cargo install --force yazi-build

exit 0
