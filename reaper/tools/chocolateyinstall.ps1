
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper708-install.exe'
$checksum32 = 'c882a90d847d278a9fbaa992636a6bfede14d5cb1c2896b0a2af8af187704587'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper708_x64-install.exe'
$checksum64 = '35f9a514066e771be7170087870807b3a121c7d338e31ee0415e36b79cf0fa99'

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
