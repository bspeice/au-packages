
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5981-install.exe'
$checksum32 = 'c4ec31cf0e64b80395113b302e577cf87d3f04e5b75a1c16ad51d18d97e2f5c6'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5981_x64-install.exe'
$checksum64 = 'e4f33796fc1b1db7466b9d8b2023c2be594fc45f01a8e7c3038eb8732cff515a'

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
