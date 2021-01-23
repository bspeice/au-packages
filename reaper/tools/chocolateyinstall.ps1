
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper620-install.exe'
$checksum32 = '98a6cf27f0518ed0082004dc562557826f2e1edb6f94f61e5295713c9d30b4cc'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper620_x64-install.exe'
$checksum64 = '406018c94c2f09078995835e21d2e6650883a4471df36f7224934e8ae45cbe01'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
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
