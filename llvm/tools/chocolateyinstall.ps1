
$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://releases.llvm.org/9.0.0/LLVM-9.0.0-win32.exe'
$checksum32 = '089e226dc0d3ecb292f344cdbed96c5d9a705564cc578957a955b4ed71c70cae'
$url64      = 'http://releases.llvm.org/9.0.0/LLVM-9.0.0-win64.exe'
$checksum64 = '71ed99a6720945d76b6772584735f2ed472f12719dff184a0b1a6a35047b8863'

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
