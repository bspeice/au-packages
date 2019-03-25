
$ErrorActionPreference = 'Stop';

$packageName= 'llvm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://releases.llvm.org/8.0.0/LLVM-8.0.0-win32.exe'
$checksum32 = '43ff5543c02873f41b87508c90509946293fe613fdbc57f8d19349e931aad6da'
$url64      = 'https://releases.llvm.org/8.0.0/LLVM-8.0.0-win64.exe'
$checksum64 = '56d582eed2d5def6accaedabbe11ae368186600798e2a6a7eb86a727fa7bb20c'

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
