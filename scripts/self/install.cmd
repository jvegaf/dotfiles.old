
:: install scoop

:: Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

::  irm get.scoop.sh | iex

:: install from scoop
::          neovim 
::          oh-my-posh 
::          fzf 

:: Install-Module posh-git -Scope CurrentUser -Force

:: Install-Module oh-my-posh -Scope CurrentUser -Force

:: Install-Module -Name Terminal-Icons -Repository PSGallery -Force

:: Install-Module -Name PSReadLine -AllowPreRelease -Force -Scope CurrentUser -SkipPublisherCheck

:: Install-Module -Name PSFzf -Scope CurrentUser -Force

:: Install-Module -Name powershell-yaml -Scope CurrentUser -Force


curl.exe -A "MS" https://webinstall.dev/bat | powershell

curl.exe -A "MS" https://webinstall.dev/fd | powershell

curl.exe -A "MS" https://webinstall.dev/delta | powershell

curl.exe -A "MS" https://webinstall.dev/lsd | powershell

curl.exe -A "MS" https://webinstall.dev/nerdfont | powershell

curl.exe -A "MS" https://webinstall.dev/rg | powershell

curl.exe -A "MS" https://webinstall.dev/pathman | powershell

curl.exe -A "MS" https://webinstall.dev/wsl | powershell


#log::note "Installing python packages"
#pip3 install -r "$DOTFILES_PATH/langs/python/requirements.txt" || true
#pip3 install -r "$DOTFILES_PATH/langs/python/requirements.txt"

#log::note "Installing php packages"
#composer global install

#log::note "Installing npm packages"
#xargs sudo npm install -g <"$DOTFILES_PATH/langs/js/global_modules.txt"

