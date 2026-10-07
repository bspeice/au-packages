
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper782-install.exe'
$checksum32 = '0ccebcefe7e9153436df7ba4db7e1c635b49051b6d00befd0d01bcd8c1c03876'
$url64 = 'https://reaper.fm/files/7.x/reaper782_x64-install.exe'
$checksum64 = 'ae86dd8396673318a85275175dc8c1c9b0b8e090bf305f9cec920358e9d1e18f'

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
