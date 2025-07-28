#!/bin/bash

# sudo apt remove -y neovim
# sudo apt autoremove -y
sudo apt-get update 
sudo apt-get install -y ninja-build gettext cmake unzip curl

cd /tmp

git clone https://github.com/neovim/neovim && \
	cd neovim && \
	git checkout stable && \
	make CMAKE_BUILD_TYPE=Release && \
	cd build && cpack -G DEB && sudo dpkg -i nvim-linux-x86_64.deb

exit 0

