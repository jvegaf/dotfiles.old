#!/bin/env bash

set -euo pipefail

SRC_PATH="$DOTFILES_PATH/os/linux/config/dconf/cinnamon"

dconf dump /org/cinnamon/ > "$SRC_PATH/cinnamon_dump.conf"
dconf dump /org/cinnamon/desktop/keybindings/ > "$SRC_PATH/keys.conf"

echo "dump finalized"

exit 0
