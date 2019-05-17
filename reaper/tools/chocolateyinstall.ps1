
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5978-install.exe'
$checksum32 = '1155f9ff4d8ee16b422741d90af3152189cbe7b3b600713c027d580b7a7d35ce'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5978_x64-install.exe'
$checksum64 = 'ec3c85dddb5d9f19822e87d19599534effb12464bfa1047f3cceaed27a641217'

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
