#!/bin/env bash

set -eu pipefail

sudo pacman -S --needed --noconfirm - < i3wm-pkgs.txt

exit 0
