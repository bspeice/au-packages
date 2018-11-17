
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5961-install.exe'
$checksum32 = '9083d514fa128810dca388bedd7bd688f050f3e02693458e20debc0b22373448'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5961_x64-install.exe'
$checksum64 = 'e5d09dc57ae66070b4aa0a37d886f2ccbfdc051f0427a09932074e66f0339788'

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
