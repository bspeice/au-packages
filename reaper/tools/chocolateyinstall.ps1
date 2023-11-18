
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper705-install.exe'
$checksum32 = 'c6ee4283eb390744929e719a1ab620d8aa2e1edd559bd7776d1c43f5dd94557b'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper705_x64-install.exe'
$checksum64 = 'cbecde7d1e184aca0159c3c8b348d01c09d501ea59af268bca76f501b33f77ff'

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
