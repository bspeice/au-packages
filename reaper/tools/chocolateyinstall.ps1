
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper656-install.exe'
$checksum32 = '842dc3c1e3ff1fd8eae26b00f4b5afd19a65d49440067c321102d5a7d8cc2b57'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper656_x64-install.exe'
$checksum64 = '1eac4b8d53fd40cbb5a439285360a66bd07531635b7f15511aee7020c15ad91a'

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
