
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper712-install.exe'
$checksum32 = '2824131a577e76becd27af2a1c42cb495f87565c2ae6630f15f1baffc68235ff'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper712_x64-install.exe'
$checksum64 = '425631feb612df001ce8efca7a13af7d0ab9ac9beeeccb7cd0da40b070c90fcf'

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
