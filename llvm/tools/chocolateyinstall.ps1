
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.0/LLVM-16.0.0-win32.exe'
$checksum32 = '84a6af869018546cee8f4de5077d7643cb69e68004f928e60bc4834d3403fa98'
$url64 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.0/LLVM-16.0.0-win64.exe'
$checksum64 = 'e41295133d6d24cc8133702768ddb4e3bffd9f9b4a9b2faf9cd0a045cfc90abc'

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
