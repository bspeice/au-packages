
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper663-install.exe'
$checksum32 = 'e2bfbdf996f1ce27d97e6d177ddcbe4c4ca5a8b75f374d48ea3742c1217aea2f'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper663_x64-install.exe'
$checksum64 = '624ed816cc23ab3d4d7f9ee072abb1e9d0b4f4b0dfc4041da86b16ff09f1c1d5'

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
