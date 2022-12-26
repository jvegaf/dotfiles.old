#!/bin/bash

set -euo pipefail

#keys
dconf dump /org/cinnamon/desktop/keybindings/ >keys.conf

#all
#
dconf dump /org/cinnamon/ >cinnamon-dump.conf

echo "dump finalized"
