
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper745-install.exe'
$checksum32 = '64e367de82a114e2d76892401f1ca1724e39c2b57c9d6432351a7b4631ef712e'
$url64 = 'https://reaper.fm/files/7.x/reaper745_x64-install.exe'
$checksum64 = '101006f0685f25054d820fab09ddae1b20726dd24264bed4ed19e27bcd34c771'

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
