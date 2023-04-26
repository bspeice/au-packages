
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper679-install.exe'
$checksum32 = 'c1630f306baeb414531f274159bbdabb22a66c8af313239178f21d3d1e04a18c'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper679_x64-install.exe'
$checksum64 = '99d656477e6b337234cca6c0b0eea7cd0463db555f51f7ec309da57d49714b39'

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
