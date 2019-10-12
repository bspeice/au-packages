
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5984-install.exe'
$checksum32 = '30af4aac294a9f2074628b28a76bd7eb121d43bd442ab0f0d60291860c922ae2'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5984_x64-install.exe'
$checksum64 = 'd6afe3562ef881b60a62a5743fd54e2f645a65e218fcd12e449d79b7f7418cad'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'reaper*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'


  silentArgs   = '/S'
  validExitCodes= @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
