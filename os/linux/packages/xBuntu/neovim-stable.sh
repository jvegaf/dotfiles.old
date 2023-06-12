#!/bin/bash

sudo apt remove -y neovim
sudo apt autoremove -y
sudo apt-get install -y ninja-build gettext cmake unzip curl

mkdir $HOME/.tmp
cd $HOME/.tmp

git clone https://github.com/neovim/neovim && \
	cd neovim && \
	git checkout stable && \
	make && \
	cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

exit 0

