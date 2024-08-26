
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper722-install.exe'
$checksum32 = '539c8191020830b5b68dd7b11f4a7e7ff38bd362d70c2b3da8cf152506aea7a8'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper722_x64-install.exe'
$checksum64 = 'ab4ff5743ad846f9d8b3c084cb4edd09cfeedd459ceacbe9c4545b105d343436'

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
