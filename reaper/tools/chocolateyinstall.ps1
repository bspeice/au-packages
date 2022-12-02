
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper671-install.exe'
$checksum32 = '21ff5fb30e61df054e7d10da94a4ea4624e2787d282626d88ffdb0938eab34f5'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper671_x64-install.exe'
$checksum64 = 'adb3e5acbc9c1b2e80652c6036dbc81fa15b62a325e2e1da3358100c50fa4e93'

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
