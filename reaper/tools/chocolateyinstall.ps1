
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper643-install.exe'
$checksum32 = '9f0b869f4125b20d0a18564ea02f7e1e2731a99c99601907af9d707dec2a019a'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper643_x64-install.exe'
$checksum64 = 'a92df108a0ce8c10457e626c6e07d75dba8ddf330a541aa506b67ac1b4f0ae1c'

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
