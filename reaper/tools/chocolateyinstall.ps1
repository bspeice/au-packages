
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper641-install.exe'
$checksum32 = '83a4c1f20bb45837b6e1a662913f8f0e823841b2fb8f0e6705fa2f261f35790c'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper641_x64-install.exe'
$checksum64 = '57d2b99ca93377c9821c876bb4260f372df3f66ebc432b2642a271801bd8741e'

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
