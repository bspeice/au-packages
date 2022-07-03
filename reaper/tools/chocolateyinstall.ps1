
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper662-install.exe'
$checksum32 = '35570bae8e2b5e469cf5a0d2680d9f8c12ca34d0ed1a790137542a94c8a9ed97'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper662_x64-install.exe'
$checksum64 = 'e17083fb86526c43162f0b23c7ec5a80a4104cb14b0336832c4d0c0db1d1783b'

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
