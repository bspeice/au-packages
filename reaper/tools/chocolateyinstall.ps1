
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper633-install.exe'
$checksum32 = 'e93444f949545810b6a54599d0a2a05d6d46384776707a6a9337b9e223a7f63f'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper633_x64-install.exe'
$checksum64 = '2daad7f30e4d38e214671d8b5cedb77db0892037cebb9e8da24973fd7ffe1bf1'

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
