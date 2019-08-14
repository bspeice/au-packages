
$ErrorActionPreference = 'Stop';

$packageName= 'llvm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/LLVM-8.0.1-win32.exe'
$checksum32 = '5d992a41f1ff6296659e66eabbcbaec34f5533fe9d1376fc94fba7450383fe69'
$url64      = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/LLVM-8.0.1-win64.exe'
$checksum64 = 'e3af139c2f93075c13dcbc4091c1311f66fc6e4e8705649fcaf9bef8b3368f41'

$packageArgs = @{
  packageName   = $packageName
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
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "Machine" # Machine will assert administrative rights
