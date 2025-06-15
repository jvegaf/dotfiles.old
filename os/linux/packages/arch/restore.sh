#!/bin/env bash

set -euo pipefail

sudo pacman -S --needed --noconfirm - < pkglist.txt

yay -S --needed --noconfirm - < aurpkglist.txt

exit 0
