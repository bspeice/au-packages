
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5987-install.exe'
$checksum32 = 'd6db938531ee6e32d6d510d4fbb0c37282579ac27a850c3d46ec8cce4794bd4b'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5987_x64-install.exe'
$checksum64 = '5dcf93ad6ae14676d37ab2b5c239ffdf5df8c340685cfa00541cb876cae1b269'

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
