# Install VCLibs
Add-AppxPackage 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'

# Install Microsoft.UI.Xaml.2.7.3 from NuGet
Invoke-WebRequest -Uri https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.7.3 -OutFile .\microsoft.ui.xaml.2.7.3.zip
Expand-Archive .\microsoft.ui.xaml.2.7.3.zip
Add-AppxPackage .\microsoft.ui.xaml.2.7.3\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.7.appx

# Install the latest release of Microsoft.DesktopInstaller from GitHub
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Add-AppxPackage .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

#Fixing Permissions
TAKEOWN /F "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_1.19.10173.0_x64__8wekyb3d8bbwe" /R /A /D Y
ICACLS "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_1.19.10173.0_x64__8wekyb3d8bbwe" /grant Administrators:F /T

#Adding it to path
$ResolveWingetPath = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe"
    if ($ResolveWingetPath){
           $WingetPath = $ResolveWingetPath[-1].Path
    }
$ENV:PATH += ";$WingetPath"