#!/bin/bash

set -eu pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

cd /tmp
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme
./install.sh

log::note "WhiteSur icon theme installed ✅"

exit 0
