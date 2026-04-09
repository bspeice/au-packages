
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper768-install.exe'
$checksum32 = 'aca8b61eb9d9017f2a7e373bf2902bf97867f0e1ed5a9ef157433323aad9e58e'
$url64 = 'https://reaper.fm/files/7.x/reaper768_x64-install.exe'
$checksum64 = '2c64c7d332f8a686d4c40fa4bbff273bea56024ee5bd61bed38e0be0e57e5e78'

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
