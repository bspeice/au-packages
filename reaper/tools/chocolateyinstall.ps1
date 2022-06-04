
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper659-install.exe'
$checksum32 = '7f95b0e0fb8cc5769feadd5215118389eeab94ce25c1bf8c43cbd671c7aafbff'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper659_x64-install.exe'
$checksum64 = '9e91c2c77dda6587b618fe87f398536c34b530659fdf89b595bd8ed5003a27ac'

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
