
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper752-install.exe'
$checksum32 = 'ce201a4e08201def61455cac086eb68546ca91a19a7a7b3fccb464bdeef71b6d'
$url64 = 'https://reaper.fm/files/7.x/reaper752_x64-install.exe'
$checksum64 = '20a8124ab2068c1fda44d1f524d9ce0c4a418a6d4df7929c90d306b429c25c2a'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url32
  url64bit       = $url64

  softwareName   = 'reaper*'

  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'


  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
