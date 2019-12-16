
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper601-install.exe'
$checksum32 = '4e8363d23d1fb3b204fe356ac8b37108f72e749a241833d51783a3ada8fcaf00'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper601_x64-install.exe'
$checksum64 = 'c5440cd6e2bd692045fd07a09d0645fc06eea8a6fbe3311efa2c6053d2554814'

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
