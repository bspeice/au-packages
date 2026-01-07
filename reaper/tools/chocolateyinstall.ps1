
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper758-install.exe'
$checksum32 = 'df9869f4b1456e72a4ac23cd2fa50d4237adddfbfc69fbf115aa9e295816c054'
$url64 = 'https://reaper.fm/files/7.x/reaper758_x64-install.exe'
$checksum64 = '9c4e0b13b2b5da38e746bc37fa43e409402d6e633d277a0b5cbbdb614092b7b4'

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
