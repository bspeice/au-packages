
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.4/LLVM-20.1.4-win32.exe'
$checksum32 = '50fa019dc48f78127197e62b1a943e2a695d8815da279c580b94d9cff5c53f36'
$url64 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.4/LLVM-20.1.4-win64.exe'
$checksum64 = 'ee6206043ce6b24edbd6ea60645852f833744d9b5898d9c5f7f7684445381a25'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url32
  url64bit       = $url64

  softwareName   = 'llvm*'

  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'


  silentArgs     = '/S'
  validExitCodes = @(0)
}


Install-ChocolateyPackage @packageArgs

# Check if Visual Studio is installed
# While there have been some reports of this not working well for some users, it is a method recommended by MSFT:
# https://docs.microsoft.com/en-us/visualstudio/install/tools-for-managing-visual-studio-instances?view=vs-2019#using-windows-management-instrumentation-wmi
# I'm open to other suggestions for detection, but can confirm that this works for both regular and admin shells for me.
try {
  (Get-CimInstance MSFT_VSInstance) | out-null
}
catch {
  Write-Host "NOTE: Visual Studio not detected. LLVM does not provide a C/C++ standard library and may be unable to locate MSVC headers."
}

Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "Machine" # Machine will assert administrative rights
Install-ChocolateyPath "$($env:SystemDrive)\Program Files (x86)\LLVM\bin" "Machine" # Machine will assert administrative rights
