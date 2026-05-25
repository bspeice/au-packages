
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper773-install.exe'
$checksum32 = '1ad6b5d3baae507076a7e2f4c0425cce6509b46a096b7076f72a4ed30415fcf6'
$url64 = 'https://reaper.fm/files/7.x/reaper773_x64-install.exe'
$checksum64 = '1a96f1aaf2c8fec04f92753078582ff577ad666f267965303daa12511db8752b'

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
