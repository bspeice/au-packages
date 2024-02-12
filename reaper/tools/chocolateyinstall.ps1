
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper711-install.exe'
$checksum32 = '2dbb6df8b2135bf599d8d710e2718608e7b8679c93e89c48bf5c63b2e6fe16c6'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper711_x64-install.exe'
$checksum64 = 'a12af2b43a1fb6b334ad3883a5eddf6cdf5011ccf7f954ac678a6349b0bc3039'

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
