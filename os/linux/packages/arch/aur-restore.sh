#!/bin/env bash

set -eu pipefail

yay -S --needed --noconfirm - < aurpkglist.txt

exit 0
