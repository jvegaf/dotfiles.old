#!/bin/bash

wget https://github.com/extrawurst/gitui/releases/latest/download/gitui-linux-musl.tar.gz
tar -xvf gitui-linux-musl.tar.gz
rm gitui-linux-musl.tar.gz
sudo mv gitui /usr/local/bin

echo "gitui installed ✅"

exit 0
