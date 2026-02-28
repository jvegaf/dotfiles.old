#!/bin/bash

set -eu pipefail

sudo add-apt-repository ppa:tomtomtom/woeusb -y
sudo apt update
sudo apt install woeusb -y

echo "woeusb has been installed successfully."

exit 0
