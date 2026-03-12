
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper765-install.exe'
$checksum32 = 'e08ad4ce99635eef9382cb38e17b797997bb719ca4cb43d449bd5c658e5b4139'
$url64 = 'https://reaper.fm/files/7.x/reaper765_x64-install.exe'
$checksum64 = 'ad1b33f90c0ded743ad160e29374c1c5fa0e82f1360087338eb738224e615178'

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
