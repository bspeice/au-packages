
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper759-install.exe'
$checksum32 = '85f738f332d57b479635f8a17b8e521d3858da2d3f9d00487625ef32b2a89786'
$url64 = 'https://reaper.fm/files/7.x/reaper759_x64-install.exe'
$checksum64 = '9401233d0fbe2183c300b8bf36c2f078ec8fc9ca6d723fd28c72ddbef29d5832'

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
