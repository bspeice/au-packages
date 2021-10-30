
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper639-install.exe'
$checksum32 = 'c24df616595f8065fa34f966585182d335a459865fa50c0aa38b5831ee8fe1aa'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper639_x64-install.exe'
$checksum64 = 'ea13b4ce022be9ce5fa7681172fdae283d2a5548d55c064a69e9ac1a4a67c1ab'

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
