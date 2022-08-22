<#
.SYNOPSIS
    Script to Initialize my custom powershell setup.
.DESCRIPTION
    Script uses scoop
.NOTES
    **NOTE** Will configure the Execution Policy for the "CurrentUser" to Unrestricted.

    Author: Mike Pruett
    Date: October 18th, 2018
#>

$VerbosePreference = "Continue"

function Install-ScoopApp {
    param (
        [string]$Package
    )
    Write-Verbose -Message "Preparing to install $Package"
    if (! (scoop info $Package).Installed ) {
        Write-Verbose -Message "Installing $Package"
        scoop install $Package
    } else {
        Write-Verbose -Message "Package $Package already installed! Skipping..."
    }
}

function Install-WinGetApp {
    param (
        [string]$PackageID
    )
    Write-Verbose -Message "Preparing to install $PackageID"
    # Added accept options based on this issue - https://github.com/microsoft/winget-cli/issues/1559
    $listApp = winget list --exact -q $PackageID --accept-source-agreements --accept-package-agreements
    if (!$listApp) {
        Write-Verbose -Message "Installing $Package"
        winget install --exact --silent $PackageID
    } else {
        Write-Verbose -Message "Package $PackageID already installed! Skipping..."
    }
}

function Install-ChocoApp {
    param (
        [string]$Package
    )
    Write-Verbose -Message "Preparing to install $Package"
    $listApp = choco list --local $Package
    if ($listApp -like "0 packages installed.") {
        Write-Verbose -Message "Installing $Package"
        Start-Process -FilePath "PowerShell" -ArgumentList "choco","install","$Package","-y" -Verb RunAs -Wait
    } else {
        Write-Verbose -Message "Package $Package already installed! Skipping..."
    }
}

function Extract-Download {
    param (
        [string]$Folder,
        [string]$File
    )
    if (!(Test-Path -Path "$Folder" -PathType Container)) {
        Write-Error "$Folder does not exist!!!"
        Break
    }
    if (Test-Path -Path "$File" -PathType Leaf) {
        switch ($File.Split(".") | Select-Object -Last 1) {
            "rar" { Start-Process -FilePath "UnRar.exe" -ArgumentList "x","-op'$Folder'","-y","$File" -WorkingDirectory "$Env:ProgramFiles\WinRAR\" -Wait | Out-Null }
            "zip" { 7z x -o"$Folder" -y "$File" | Out-Null }
            "7z" { 7z x -o"$Folder" -y "$File" | Out-Null }
            "exe" { 7z x -o"$Folder" -y "$File" | Out-Null }
            Default { Write-Error "No way to Extract $File !!!"; Break }
        }
    }
}

function Download-CustomApp {
    param (
        [string]$Link,
        [string]$Folder
    )
    if ((curl -sIL "$Link" | Select-String -Pattern "Content-Disposition") -ne $Null) {
        $Package = $(curl -sIL "$Link" | Select-String -Pattern "filename=" | Split-String -Separator "=" | Select-Object -Last 1).Trim('"')
    } else {
        $Package = $Link.split("/") | Select-Object -Last 1
    }
    Write-Verbose -Message "Preparing to download $Package"
    aria2c --quiet --dir="$Folder" "$Link"
    Return $Package
}

function Install-CustomApp {
    param (
        [string]$URL,
        [string]$Folder
    )
    $Package = Download-CustomApp -Link $URL -Folder "$Env:UserProfile\Downloads\"
    if (Test-Path -Path "$Env:UserProfile\Downloads\$Package" -PathType Leaf) {
        if (Test-Path Variable:Folder) {
            if (!(Test-Path -Path "$Env:UserProfile\bin\$Folder")) {
                New-Item -Path "$Env:UserProfile\bin\$Folder" -ItemType Directory | Out-Null
            }
            Extract-Download -Folder "$Env:UserProfile\bin\$Folder" -File "$Env:UserProfile\Downloads\$Package"
        } else {
            Extract-Download -Folder "$Env:UserProfile\bin\" -File "$Env:UserProfile\Downloads\$Package"
        }
        Remove-Item -Path "$Env:UserProfile\Downloads\$Package"
    }
}

function Install-CustomPackage {
    param (
        [string]$URL
    )
    $Package = Download-CustomApp -Link $URL
    if (Test-Path -Path "$Env:UserProfile\Downloads\$Package" -PathType Leaf) {
        Start-Process -FilePath ".\$Package" -ArgumentList "/S" -WorkingDirectory "${Env:UserProfile}\Downloads\" -Verb RunAs -Wait #-WindowStyle Hidden
        Remove-Item -Path "$Env:UserProfile\Downloads\$Package"
    }
}

function Remove-InstalledApp {
    param (
        [string]$Package
    )
    Write-Verbose -Message "Uninstalling: $Package"
    Start-Process -FilePath "PowerShell" -ArgumentList "Get-AppxPackage","-AllUsers","-Name","'$Package'" -Verb RunAs -WindowStyle Hidden
}

function Enable-Bucket {
    param (
        [string]$Bucket
    )
    if (!($(scoop bucket list).Name -eq "$Bucket")) {
        Write-Verbose -Message "Adding Bucket $Bucket to scoop..."
        scoop bucket add $Bucket
    } else {
        Write-Verbose -Message "Bucket $Bucket already added! Skipping..."
    }
}

# Configure ExecutionPolicy to Unrestricted for CurrentUser Scope
if ((Get-ExecutionPolicy -Scope CurrentUser) -notcontains "Unrestricted") {
    Write-Verbose -Message "Setting Execution Policy for Current User..."
    Start-Process -FilePath "PowerShell" -ArgumentList "Set-ExecutionPolicy","-Scope","CurrentUser","-ExecutionPolicy","Unrestricted","-Force" -Verb RunAs -Wait
    Write-Output "Restart/Re-Run script!!!"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/jvegaf/dotfiles/win/installer.ps1'))
    Break
}

# Install Scoop, if not already installed
$scoopInstalled = Get-Command "scoop"
if (!$scoopInstalled) {
    Write-Verbose -Message "Installing Scoop..."
    iex ((New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh'))
}

# Install Chocolatey, if not already installed
$chocoInstalled = Get-Command "choco" -CommandType Application -ErrorAction Ignore
if (!$chocoInstalled) {
    Write-Verbose -Message "Installing Chocolatey..."
@'
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
'@ > $Env:Temp\choco.ps1
    Start-Process -FilePath "PowerShell" -ArgumentList "$Env:Temp\choco.ps1" -Verb RunAs -Wait
    Remove-Item -Path $Env:Temp\choco.ps1 -Force
}

# Install WinGet, if not already installed
# From crutkas's gist - https://gist.github.com/crutkas/6c2096eae387e544bd05cde246f23901
$hasPackageManager = Get-AppPackage -name "Microsoft.DesktopAppInstaller"
if (!$hasPackageManager) {
    Write-Verbose -Message "Installing WinGet..."
@'
# Set URL and Enable TLSv12
$releases_url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Dont Think We Need This!!!
#Install-PackageProvider -Name NuGet

# Install Nuget as Package Source Provider
Register-PackageSource -Name Nuget -Location "http://www.nuget.org/api/v2" -ProviderName Nuget -Trusted

# Install Microsoft.UI.Xaml (This is not currently working!!!)
Install-Package Microsoft.UI.Xaml -RequiredVersion 2.7.1

# Grab "Latest" release
$releases = Invoke-RestMethod -uri $releases_url
$latestRelease = $releases.assets | Where { $_.browser_download_url.EndsWith('msixbundle') } | Select -First 1

# Install Microsoft.DesktopAppInstaller Package
Add-AppxPackage -Path $latestRelease.browser_download_url
'@ > $Env:Temp\winget.ps1
    Start-Process -FilePath "PowerShell" -ArgumentList "$Env:Temp\winget.ps1" -Verb RunAs -Wait
    Remove-Item -Path $Env:Temp\winget.ps1 -Force
}

# Configure git
Install-ScoopApp -Package "git"
if (!$(git config --global credential.helper) -eq "manager-core") {
    git config --global credential.helper manager-core
}
if (!($Env:GIT_SSH)) {
    Write-Verbose -Message "Setting GIT_SSH User Environment Variable"
    [System.Environment]::SetEnvironmentVariable('GIT_SSH', (Resolve-Path (scoop which ssh)), 'USER')
}
if ((Get-Service -Name ssh-agent).Status -ne "Running") {
    Start-Process -FilePath "PowerShell" -ArgumentList "Set-Service","ssh-agent","-StartupType","Manual" -Verb RunAs -Wait -WindowStyle Hidden
}

# Only install OpenSSH Package, if not on Windows 10
if ([Environment]::OSVersion.Version.Major -lt 10) {
    Install-ScoopApp -Package "openssh"
}


## Add Buckets
Enable-Bucket -Bucket "extras"
Enable-Bucket -Bucket "java"
Enable-Bucket -Bucket "nirsoft"
scoop bucket add foosel https://github.com/foosel/scoop-bucket

# UNIX Tools
Write-Verbose -Message "Removing curl Alias..."
if (Get-Alias -Name curl -ErrorAction SilentlyContinue) {
    Remove-Item alias:curl    
}
if (!($Env:TERM)) {
    Write-Verbose -Message "Setting TERM User Environment Variable"
    [System.Environment]::SetEnvironmentVariable("TERM", "xterm-256color", "USER")
}

# Check if Home Workstation
if ($(Read-Host -Prompt "Is this a workstation for Home use (y/n)?") -eq "y") {
    $HomeWorkstation = $True
} else {
    $HomeWorkstation = $False
}

# Home Workstation Configurations
if ($HomeWorkstation) {
    # Adding games bucket
    Enable-Bucket -Bucket "games"
    # Create $Env:UserProfile\bin, if not exist
    if (!(Test-Path -Path $Env:UserProfile\bin)) {
        Write-Verbose -Message "Creating bin directory in $Env:UserProfile"
        New-Item -Path $Env:UserProfile\bin -ItemType Directory | Out-Null
        #[System.Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";$Env:UserProfile\bin","USER")
    }
}

# Install Scoop Packages
$Scoop = @(
    "scoop-tray",
    "clink",
    "concfg",
    "curl",
    "fzf",
    "neovim",
    "colortool",
    "sudo",
    "vscode",
    "openjdk",
    "go",
    "python",
    "putty",
    "etcher",
    "cpu-z",
    "gpu-z",
    "ssd-z",
    "hwmonitor",
    "powertoys",)#,"rktools2k3")
foreach ($item in $Scoop) {
    Install-ScoopApp -Package "$item"
}

# Install Scoop Packages, if Home Workstation
if ($HomeWorkstation) {
    Remove-Variable -Name "Scoop"
    $Scoop = @(
        "ffmpeg",
        "vlc",
        "lame",
        "mp3tag",)
    foreach ($item in $Scoop) {
        Install-ScoopApp -Package "$item"
    }
}

# Install WinGet Packages
$WinGet = @(
    "Microsoft.PowerShell",
    "Microsoft.dotNetFramework",
    "Microsoft.dotnetRuntime.3-x64",
    "Microsoft.dotnetRuntime.5-x64",
    "Microsoft.dotnetRuntime.6-x64",
    "Microsoft.WindowsTerminal",
    "TeamViewer.TeamViewer",
    "Google.Chrome",
    "10186emoacht.Monitorian_0q7myvhtpbc7w",
    "21090PaddyXu.QuickLook_egxr34yet59cg"
    )
foreach ($item in $WinGet) {
    Install-WinGetApp -PackageID "$item"
}

# Add Directories to User Path
#[System.Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";$Env:ProgramFiles\WinRAR","USER")

# Install WinGet Packages, if Home Workstation
if ($HomeWorkstation) {
    Remove-Variable -Name "WinGet"
    $WinGet = @(
        "VideoLAN.VLC",
        "TheDocumentFoundation.LibreOffice"
    )
    foreach ($item in $WinGet) {
        Install-WinGetApp -PackageID "$item"
    }
}

# Install Chocolatey Packages
$Choco = @(
    "sublimetext4",
    "1password"
)
foreach ($item in $Choco) {
    Install-ChocoApp -Package "$item"
}

# Install Tasmota Device Manager from Github
New-Item -Path "$Env:UserProfile\bin\TasmotaDM" -ItemType Directory | Out-Null
Download-CustomApp -Link "https://github.com/jziolkowski/tdm/releases/download/v0.2.11/tdmgr_0.2.11.exe" -Folder "$Env:UserProfile\bin\TasmotaDM" | Out-Null

# Install EasyEDA Router from EasyEDA
Install-CustomApp -URL "https://image.easyeda.com/files/easyeda-router-windows-x64-v0.8.11.zip"


# Create scoop-tray shortcut in shell:startup
if (!(Test-Path -Path "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup\scoop-tray.lnk" -PathType Leaf)) {
    Write-Verbose -Message "Create scoop-tray shortcut in shell:startup..."
    $WSHShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WSHShell.CreateShortcut("$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup\scoop-tray.lnk")
    $Shortcut.TargetPath = "$Env:UserProfile\scoop\apps\scoop-tray\current\scoop-tray.bat"
    $Shortcut.WindowStyle = 7
    $Shortcut.IconLocation = "%USERPROFILE%\scoop\apps\scoop-tray\current\updates-available.ico"
    $Shortcut.Description = "scoop-tray.bat"
    $Shortcut.WorkingDirectory = Split-Path "$Env:UserProfile\scoop\apps\scoop-tray\current\scoop-tray.bat" -Resolve
    $Shortcut.Save()
}

# Customize DOS/PowerShell Environment
Write-Verbose -Message "Customize DOS/PowerShell Environment..."
if ((Get-ItemProperty -Path "HKCU:\Software\Microsoft\Command Processor").AutoRun -eq $Null) {
    Start-Process -FilePath "cmd" -ArgumentList "/c","clink","autorun","install" -Wait -WindowStyle Hidden
}
Start-Process -FilePath "cmd" -ArgumentList "/c","concfg","import","solarized-dark" -Verb RunAs -Wait


# Pin Run to Taskbar
#Start-Process -FilePath "PowerShell" -ArgumentList "syspin","'$Env:AppData\Microsoft\Windows\Start Menu\Programs\System Tools\Run.lnk'","c:5386" -Wait -NoNewWindow
# Pin Google Chrome to Taskbar
Write-Verbose -Message "Pin Google Chrome to Taskbar..."
Start-Process -FilePath "PowerShell" -ArgumentList "syspin","'$Env:ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk'","c:5386" -Wait -NoNewWindow



# Pin PowerShell to Taskbar
Write-Verbose -Message "Pin PowerShell to Taskbar..."
Start-Process -FilePath "PowerShell" -ArgumentList "syspin","'$Env:AppData\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk'","c:5386" -Wait -NoNewWindow

# Install PowerShell 7
$PS7 = winget list --exact -q Microsoft.PowerShell
if (!$PS7) {
    Write-Verbose -Message "Installing PowerShell 7..."
@'
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet"
'@ > $Env:Temp\ps7.ps1
    Start-Process -FilePath "PowerShell" -ArgumentList "$Env:Temp\ps7.ps1" -Verb RunAs -Wait -WindowStyle Hidden
    Remove-Item -Path $Env:Temp\ps7.ps1 -Force
}
# Pin PowerShell 7 to Taskbar
Write-Verbose -Message "Pin PowerShell 7 to Taskbar..."
Start-Process -FilePath "PowerShell" -ArgumentList "syspin","'$Env:ProgramData\Microsoft\Windows\Start Menu\Programs\PowerShell\PowerShell 7 (x64).lnk'","c:5386" -Wait -NoNewWindow

# Remove unused Packages/Applications
Write-Verbose -Message "Removing Unused Applications..."
$RemoveApps = @(
    "*3DPrint*",
    "Microsoft.MixedReality.Portal")
foreach ($item in $RemoveApps) {
    Remove-InstalledApp -Package $item
}

# Install Windows SubSystems for Linux
$wslInstalled = Get-Command "wsl" -CommandType Application -ErrorAction Ignore
if (!$wslInstalled) {
    Write-Verbose -Message "Installing Windows SubSystems for Linux..."
    Start-Process -FilePath "PowerShell" -ArgumentList "wsl","--install" -Verb RunAs -Wait -WindowStyle Hidden
}
Install-WinGetApp -PackageID Canonical.Ubuntu
Write-Output "Install complete! Please reboot your machine/worksation!"
Start-Sleep -Seconds 10
