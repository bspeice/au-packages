
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5977-install.exe'
$checksum32 = 'b6e09572a8caa6c23bb37f5467ce28fcc28e32b622d73dc610b1200c5594ab28'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5977_x64-install.exe'
$checksum64 = '4ca4b11505813fddd38d27a12ed4497d6c3411fe08315c9a8d8758168006748d'

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
