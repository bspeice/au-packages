
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5980-install.exe'
$checksum32 = 'b1a81d39010460ab0bfba0b61fdab45103d821ddfa86023fc9bfcfd2a7e9e69d'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5980_x64-install.exe'
$checksum64 = 'd11b5d8df8a28e94ddae4f5215440f299782c03fbd191494190da91ef59080d6'

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
