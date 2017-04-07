
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://reaper.fm/files/5.x/reaper540-install.exe'
$checksum32 = '054107490b74877cf9f07cc3d7970669aae780ec908c6978071309cd44f40dd9'
$url64      = 'http://reaper.fm/files/5.x/reaper540_x64-install.exe'
$checksum64 = '185062e24c631342f3083748407f732b4895fefccad85d4553b32a5cdb1ed7ce'

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
