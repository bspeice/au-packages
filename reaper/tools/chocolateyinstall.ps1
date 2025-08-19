
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper743-install.exe'
$checksum32 = 'a2ceed51955dfdadf33358147cb12046503879c53dfa784cb07e5b690ec61f9e'
$url64 = 'https://reaper.fm/files/7.x/reaper743_x64-install.exe'
$checksum64 = 'b12631c18436f55858d2bc0a4a6e2dff4e37ebf93923ae7e84e77693b819a261'

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
