#!/bin/bash

set -euo pipefail

#keys
# sudo dconf load /org/cinnamon/desktop/keybindings/ < keys.conf

#all
#
dconf load /org/cinnamon/ <cinnamon-dump.conf

echo "config restored"

exit 0
