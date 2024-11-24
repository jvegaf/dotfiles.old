#!/bin/bash

set -eu pipefail

dump_file="$DOTFILES_PATH/os/linux/config/dconf/cinnamon/cinnamon_dump.conf"

dconf load /org/cinnamon/ < $dump_file

echo "config restored"

exit 0
