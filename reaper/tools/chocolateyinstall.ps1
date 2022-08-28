
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper666-install.exe'
$checksum32 = '528028c24580bc67fccaa9b2fc9a04dde3c655de05189a56ae936197c1571dea'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper666_x64-install.exe'
$checksum64 = '63c6ffc3dec82c38339fad7f88ce3c661c0e0cb4dc3d39b1db89d8df7253b40c'

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
