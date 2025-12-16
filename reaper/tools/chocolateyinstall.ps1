
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper756-install.exe'
$checksum32 = 'd751305cca13bceffc2570a24f0197c55fa7ae60e35e07ecb364172e50399c1e'
$url64 = 'https://reaper.fm/files/7.x/reaper756_x64-install.exe'
$checksum64 = '491f9225d1b0d730b2e322f5a60c80d368f5782ab0dcec1d75ea7da80b820537'

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
