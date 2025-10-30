
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper749-install.exe'
$checksum32 = '6e793222b8ce922be0b22744d81fc7d719e52659ab93f51a1de1110401d7309a'
$url64 = 'https://reaper.fm/files/7.x/reaper749_x64-install.exe'
$checksum64 = '88fe469283a6e0779642b0e7638b2071706951fe3730c8489a21583737ebd0aa'

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
