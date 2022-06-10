
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper660-install.exe'
$checksum32 = '474983470f154ff960f933e1ec49ba5e7bdfe95298b5bebe3cf60f3995000900'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper660_x64-install.exe'
$checksum64 = '7e855107f7d2ce429d00b0403895d6c0dff1e17266c8cf2e51fd331709f8e27f'

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
