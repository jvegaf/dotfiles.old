#!/bin/bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

cd "/var/lib/snapd/desktop/applications"
cp -u *.desktop "$HOME/.local/share/applications/"

log::note "snap applications links updated ✅"

exit 0
