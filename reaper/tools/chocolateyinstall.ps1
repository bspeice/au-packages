
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper785-install.exe'
$checksum32 = 'c2f1c37423196bf0ce8a1b87ef20ccba67e19f7c01de7e54347f6cc83306eb10'
$url64 = 'https://reaper.fm/files/7.x/reaper785_x64-install.exe'
$checksum64 = '4d30d0e6df3e05d4df594ed7b1ce6465e95c9f3b15a3457ca95730c3f26fc2a9'

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
