
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper741-install.exe'
$checksum32 = 'd819a5f6b2be559d6bd0b0783035bc6d0e457378013476204eca08c34ef86918'
$url64 = 'https://reaper.fm/files/7.x/reaper741_x64-install.exe'
$checksum64 = 'abbab83443a81afc78104ac854f44b746b1640b61b9e89f42b6ad8b0ffaf35b5'

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
