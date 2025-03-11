
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper729-install.exe'
$checksum32 = 'dcb72faebc0e07658960e61012a47bc2d3cc06b94c91653645aebb03db5538e8'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper729_x64-install.exe'
$checksum64 = 'a924c684b47e0c9316e967062e98fda049d647ea1130ae3e3dba0f7d72f22276'

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
