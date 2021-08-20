
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper634-install.exe'
$checksum32 = 'f94accafedfc12665d72a6623f55045d9b27cc156f9bff4edb7edb030275e8be'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper634_x64-install.exe'
$checksum64 = 'b36f0912c5b8f99705a480d34186208448b48023ba356b272daaaf524952b641'

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
