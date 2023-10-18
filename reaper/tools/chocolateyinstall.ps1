
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper7001-install.exe'
$checksum32 = 'd822a3951ef86c33a1486250e95c252049572db0101cab2f0991d9287888146b'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper7001_x64-install.exe'
$checksum64 = '39d4e8306ebf819d40fbefc6dc8b49da5e7645f2139a5ab95aa4af9b3faf0178'

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
