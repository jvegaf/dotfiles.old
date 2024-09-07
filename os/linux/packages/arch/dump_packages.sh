#!/bin/bash

set -euo pipefail

echo "dumping packages ⚡"

today=$(date +%Y%m%d)

pacman -Qqen >pkglist."$today".txt
pacman -Qqem >aurpkglist."$today".txt

echo "packages dumped ✅"

exit 0
