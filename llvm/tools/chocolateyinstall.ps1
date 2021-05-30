
$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/LLVM-12.0.0-win32.exe'
$checksum32 = 'bbb264bc9c8300c8f98a129050d94127cba8370ee26e4f9b1fe9cced03b1f638'
$url64      = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/LLVM-12.0.0-win64.exe'
$checksum64 = '8426d57f2af2bf07f80014bfd359e87ed10f5521a236a10cfe9fc4870d1b1b25'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'llvm*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'


  silentArgs   = '/S'
  validExitCodes= @(0)
}


Install-ChocolateyPackage @packageArgs

# Check if Visual Studio is installed
(Get-CimInstance MSFT_VSInstance) | out-null
if (!($?)) {
  Write-Host "NOTE: Visual Studio not detected. LLVM does not provide a C/C++ standard library and may be unable to locate MSVC headers."
}

Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "Machine" # Machine will assert administrative rights
