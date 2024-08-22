
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper720-install.exe'
$checksum32 = '5273904db035cf78713ebd27c9f2b510bd320fd626806667e80cb3d8f0bf1b34'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper720_x64-install.exe'
$checksum64 = 'ab9d5ce6d2181cfbf9b641bf624dac32116458088b322b86a5b49b79ea0737da'

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
