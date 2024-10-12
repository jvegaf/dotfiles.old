#!/bin/bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

sudo add-apt-repository -y ppa:mixxx/mixxxbetas
sudo apt update
sudo apt install mixxx -y



log::note "Mixxx Beta installed ✅"

exit 0
