#!/bin/bash

set -euo pipefail

NVIM_DIR=$HOME/.config/nvim
NVIM_USER=$NVIM_DIR/lua/user

if [-d "$NVIM_DIR" ]; then rm -Rf $NVIM_DIR; fi

git clone --depth 1 https://github.com/AstroNvim/AstroNvim $NVIM_DIR
git clone https://github.com/jvegaf/astronvim_user $NVIM_USER
cd $NVIM_USER && nvim

exit 0

