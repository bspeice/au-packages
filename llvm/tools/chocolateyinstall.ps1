
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-21.1.7/LLVM-21.1.7-win32.exe'
$checksum32 = '72ece0c1f67509c7f16a77707050bce8edb69081d5ed59b2240375d43686374b'
$url64 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-21.1.7/LLVM-21.1.7-win64.exe'
$checksum64 = '0ee11d3a8b9b64236c72c4a931fd40f138155e7df61b9df292fc0210b580945e'

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
