#!/bin/env bash

set -euo pipefail

sudo yay -S --needed --noconfirm - < pkglist.txt

yay -S --needed --noconfirm - < aurpkglist.txt

exit 0
