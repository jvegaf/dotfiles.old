#!/bin/bash

# install awesomewm

#sudo apt build-dep cmake lua5.4 
#git clone https://github.com/awesomewm/awesome
#cd awesome
#make package
#sudo apt install *.deb

#cd ..
#rm -rf awesome



# install picom 

sudo apt install awesome fonts-font-awesome fonts-materialdesignicons-webfont fonts-material-design-icons-iconfont
 picom kitty rofi acpi acpid acpi-call-dkms wireless-tools \
	jq inotify-tools policykit-1-gnome xdotool xclip maim \
	brightnessctl alsa-utils alsa-tools pulseaudio lm-sensors gpick \
	mpd mpc mpdris2 ncmpcpp playerctl redshift ffmpeg bluez bluez-tools

# For automatically launching mpd on login
systemctl --user enable mpd.service
systemctl --user start mpd.service

# For charger plug/unplug events (if you have a battery)
sudo systemctl enable acpid.service
sudo systemctl start acpid.service


