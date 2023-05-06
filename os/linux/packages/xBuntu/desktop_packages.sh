sudo add-apt-repository ppa:rockowitz/ddcutil -y
sudo apt-get update

sudo apt-get install -y ddcutil

sudo cp $DOTFILES_PATH/os/linux/config/nvidia_desktop/90-nvidia_i2c.conf /etc/X11/xorg.conf.d

sudo cp $DOTFILES_PATH/os/linux/config/nvidia_desktop/60-i2c-tools.rules /lib/udev/rules.d/
