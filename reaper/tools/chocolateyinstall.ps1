
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper783-install.exe'
$checksum32 = 'da696b30e1a5b92b14eba5c00f9d3ca9cd4153a67946963fc36ef121b7675cc9'
$url64 = 'https://reaper.fm/files/7.x/reaper783_x64-install.exe'
$checksum64 = 'a1f0ea602806145c2648f7f678974bda35304b178d29cf72d8255b7218a5e0c8'

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
