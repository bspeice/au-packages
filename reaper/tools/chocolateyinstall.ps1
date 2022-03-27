
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper651-install.exe'
$checksum32 = '59707418c93a2cc75c30530c424392c52e74ab1ec9454a769456f92bfe269947'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper651_x64-install.exe'
$checksum64 = '1ad92041326f958a852cd3ec3df9b8a77f15a8f8ecaba087d7780a30e3123f43'

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
