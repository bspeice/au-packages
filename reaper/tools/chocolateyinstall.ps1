
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper771-install.exe'
$checksum32 = '25824d92e6cd742adbfaaf315849c3ec3aa2e8694f3421d123cf723a27867360'
$url64 = 'https://reaper.fm/files/7.x/reaper771_x64-install.exe'
$checksum64 = '95b7ddddb339e17c224153fd9876f8e3bdefa9949182469ca8dae47aba06de6a'

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
