
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper637-install.exe'
$checksum32 = '32584e34a47ced7607d8491e3670b56e385bb2e0f629c3cf454d0349f3a5b77e'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper637_x64-install.exe'
$checksum64 = '025173becbcf1a8ee293022da783d0c6fd5a3f00e2052da40f043e333b92e7f2'

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
