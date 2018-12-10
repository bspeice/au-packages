
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5963-install.exe'
$checksum32 = '3dc71eec60ab4314b01d3afa154dd6b5012983a2e71299add45f09454f418d62'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5963_x64-install.exe'
$checksum64 = 'ec3d0f9bcf2362ba3320109134ca0115da1a79c45f070c83b98096edae3eefc6'

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
