
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5975-install.exe'
$checksum32 = 'ba58bd4481f58acfad1da0d240f5216555efa71f9368a9eb85b1883e2d1890bd'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5975_x64-install.exe'
$checksum64 = '060fab18429c62ae9b9acd63687d0a8b8a1122afbfb3115f4d852e90c9a027ce'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'reaper*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'


  silentArgs   = '/S'
  validExitCodes= @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
