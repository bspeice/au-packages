
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper755-install.exe'
$checksum32 = 'd9a12fda4993f97b99154518ce0da829d69d4721d3c0326587d76b8e468b726e'
$url64 = 'https://reaper.fm/files/7.x/reaper755_x64-install.exe'
$checksum64 = '355f727c8b0d3d5b7dc0c80a35905a4c52ca38d2b984b0ecc5d3130c7c6823c1'

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
