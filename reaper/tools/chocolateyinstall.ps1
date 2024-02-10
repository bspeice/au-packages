
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper710-install.exe'
$checksum32 = '5ae2cdef3672439a4e7eb3170029f30ac5a3dcf3aa712b1dedd83386094332e2'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper710_x64-install.exe'
$checksum64 = 'd300f20eea5bbf253698a45c079909c15705af0474310d963424650fc15b85fb'

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
