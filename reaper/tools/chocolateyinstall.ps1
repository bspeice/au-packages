
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper683-install.exe'
$checksum32 = '6feca0d5e73c5b810912862f4d712dfd5c47986e1c68f8725a2c8281540fd4fe'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper683_x64-install.exe'
$checksum64 = 'c02cf2b3c37058009d16616e502e2b53264a57a4d3ddc67db8c90c473651c342'

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
