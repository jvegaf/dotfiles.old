#!/bin/bash

fonts_folder="$HOME/.fonts"

mkdir $fonts_folder

cd $fonts_folder

curl -Lo firacode.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip"
curl -Lo firamono.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip"
curl -Lo jetbrains_mono.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip"

unar firacode.zip && unar firamono.zip && unar jetbrains_mono.zip

echo "Nerd Fonts installed ✅"

exit 0
