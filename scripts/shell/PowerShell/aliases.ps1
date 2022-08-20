# "exports"exports"Easier Navigation: .., ..., ...., ....., and ~
${function:~} = { Set-Location ~ }
# PoSh won't allow ${function:..} because of an invalid path error, so...
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }

# Navigation Shortcuts
${function:cdc} = { Set-Location ~\Code }
${function:cddf} = { Set-Location ~\.dotfiles }
${function:dt} = { Set-Location ~\Desktop }
${function:docs} = { Set-Location ~\Documents }
${function:dl} = { Set-Location ~\Downloads }
${function:pdocs} = { Set-Location "~\My Private Documents" }

# Missing Bash aliases
Set-Alias time Measure-Command

# Correct PowerShell Aliases if tools are available (aliases win if set)
# WGet: Use `wget.exe` if available
if (Get-Command wget.exe -ErrorAction SilentlyContinue | Test-Path) {
    Remove-Item alias:wget -ErrorAction SilentlyContinue
}

# Directory Listing: Use `ls.exe` if available
if (Get-Command ls.exe -ErrorAction SilentlyContinue | Test-Path) {
    Remove-Item alias:ls -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:ls} = { lsd.exe --color @args }
    # List all files in long format
    ${function:l} = { lsd -laF @args }
    # List only directories
    ${function:ldd} = { Get-ChildItem -Directory -Force @args }
} else {
    # List all files, including hidden files
    ${function:la} = { ls -Force @args }
    # List only directories
    ${function:ldd} = { Get-ChildItem -Directory -Force @args }
    Set-Alias l ls
}

# curl: Use `curl.exe` if available
if (Get-Command curl.exe -ErrorAction SilentlyContinue | Test-Path) {
    Remove-Item alias:curl -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:curl} = { curl.exe @args }
    # Gzip-enabled `curl`
    ${function:gurl} = { curl --compressed @args }
} else {
    # Gzip-enabled `curl`
    ${function:gurl} = { curl -TransferEncoding GZip }
}

# Create a new directory and enter it
Set-Alias mkd CreateAndSet-Directory

# Determine size of a file or total size of a directory
Set-Alias fs Get-DiskUsage

# Empty the Recycle Bin on all drives
Set-Alias emptytrash Empty-RecycleBin

# Cleanup old files all drives
Set-Alias cleandisks Clean-Disks

# Reload the shell
Set-Alias reload Reload-Powershell

# http://xkcd.com/530/
Set-Alias mute Set-SoundMute
Set-Alias unmute Set-SoundUnmute

# Update installed Ruby Gems, NPM, and their installed packages.
Set-Alias update System-Update

# Set Dark Mode
function darkMode { Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
}

function lightMode {Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1
}

# Set GVim as default vim
Set-Alias v nvim

# remove not empty dir
function rmd ($dir){ Remove-Item -Recurse -Force $dir }

#search on google
function gg ($query){ Start-Process "www.google.com/search?q=$query"}

# Git 
function gaa { git add -A }
function gcm { git commit }
function gcm { git commit -m }
function gcl { git clone }
function gf { git fetch --all -p }
function gps { git push }
function gs { git status -sb }
function gsw($branch) { git switch $branch}

function gba { git branch --all}

$sblm_path = Join-Path $env:USERPROFILE ".\.opt\sublime_text\subl.exe"

Set-Alias subl $sblm_path