#!/bin/bash

set -euo pipefail

dump_file="$DOTFILES_PATH/os/linux/config/dconf/cinnamon_dump.conf"

rm -rf "$dump_file"

dconf dump /org/cinnamon/ > $dump_file

echo "dump finalized"

exit 0
