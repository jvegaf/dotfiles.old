#!/bin/env bash

set -eu pipefail

yay -Syu --needed --noconfirm - <i3wm-pkgs.txt

exit 0
