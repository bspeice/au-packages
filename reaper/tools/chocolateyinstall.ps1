
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper682-install.exe'
$checksum32 = 'a2d5acd0f7011d0f3c9276a13a69c44b0da7cd7d9277ae75e1ebf406a545076d'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper682_x64-install.exe'
$checksum64 = 'c9770914e723cbec3ad1fa1581c4d9210b83df91d2f8678ce91c6ade13ff67e5'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url32
  url64bit       = $url64

  softwareName   = 'reaper*'

  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'


  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
