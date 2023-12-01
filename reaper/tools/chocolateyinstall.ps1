
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper706-install.exe'
$checksum32 = '6cacee594d02800d7e18412e2a4a3fccff59d56185ad58ad6377e287cee33b10'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper706_x64-install.exe'
$checksum64 = 'c06ff9ea1d58b8d71166a98f2a4733a19aa4d229ba59efab0c89dc5abeba7dbb'

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
