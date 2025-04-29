
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper737-install.exe'
$checksum32 = '2249af3d676b65b2c9a88a06e041abeed4a5f046d66776cf1910d995f05b44fc'
$url64 = 'https://reaper.fm/files/7.x/reaper737_x64-install.exe'
$checksum64 = 'de275a3cfc7d30552eb8fc2b955be8635cd9c9448055d774e2ffe74aee36b09c'

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
