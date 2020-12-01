
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper617-install.exe'
$checksum32 = 'cbca1b73b5b7eecfaeabaf389e3e093851acf637ef55009479196cd3b7a9cff4'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper617_x64-install.exe'
$checksum64 = '31971d25486836d6cda0c2c6360be51fcb30e9e76bfcab06b7d657dd441240f4'

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
