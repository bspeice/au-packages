
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper716-install.exe'
$checksum32 = '60ba2ab40e706525c44effdb0064306fd0f68a07ae74103fdbdd0a77b721bf9e'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper716_x64-install.exe'
$checksum64 = '1b68640aa8fd10bd30af2f5a3e0a2a04bc203300fabbbc2401473c07be264632'

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
