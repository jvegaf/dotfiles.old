#!/bin/env bash

set -eu pipefail

paru -Syu --needed --noconfirm - <i3wm-pkgs.txt

exit 0
