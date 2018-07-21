
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper593-install.exe'
$checksum32 = 'b1d1cf1f24a24957363f1fc3090a562c52bce1907200b82ecba4a5930f47f2e0'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper593_x64-install.exe'
$checksum64 = '683874021b1a77d7ec9cc04050ccd3e0ba5ea52e605de669b7db9b549ad1866d'

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
