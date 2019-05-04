
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5976-install.exe'
$checksum32 = 'b66313b3895f881ecc73c74040ba1f5f7a59f0e9d622bb9eaf3d302d05e30302'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5976_x64-install.exe'
$checksum64 = '00838643939714909f4ec1dd229701e01b4410b06fe262e49f9c3c8f73fcd6b3'

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
