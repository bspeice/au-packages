
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper714-install.exe'
$checksum32 = 'adc02ebe896984230278052be27dfa8f02afc4c9a5ad47a3e1ca1defe7b77a69'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper714_x64-install.exe'
$checksum64 = '2a29407a012be17087edc4de06d1c4ae96f72ae52097aaa98bc2707d7d7624c7'

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
