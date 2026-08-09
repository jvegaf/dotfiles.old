#!/bin/bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

cd /tmp
# replace `x86_64-unknown-linux-gnu.deb` with your desired package
wget 'https://github.com/ms-jpq/sad/releases/latest/download/x86_64-unknown-linux-gnu.deb' && \
  sudo  dpkg -i x86_64-unknown-linux-gnu.deb

log::note "Sad installed ✅"

exit 0
