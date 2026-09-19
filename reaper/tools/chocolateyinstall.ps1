
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper780-install.exe'
$checksum32 = '55313b8b705d324e509b7d00cdde2484cacb951db3c9f47822d5d7606459b84f'
$url64 = 'https://reaper.fm/files/7.x/reaper780_x64-install.exe'
$checksum64 = 'aecb15fc1b08abdc5520740d1e128a02bd02a3eb4746da857eb0b9818731da28'

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
