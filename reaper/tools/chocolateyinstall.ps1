
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper665-install.exe'
$checksum32 = '5ccb7f9108cb2674ef54cea94831b5b7864844ad8032b26a613fad583e453af9'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper665_x64-install.exe'
$checksum64 = '23e3563589b3608acdc15f7ee065f4e3638f90fb8c75a965b289953b2524e222'

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
