sudo add-apt-repository ppa:rockowitz/ddcutil -y
sudo apt-get update

sudo apt-get install -y ddcutil

sudo cp -R $DOTFILES_PATH/os/linux/configs/nvidia_desktop/xorg.conf.d /etc/X11/

sudo cp $DOTFILES_PATH/os/linux/configs/nvidia_desktop/60-i2c-tools.rules /lib/udev/rules.d/
