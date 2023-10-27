
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper702-install.exe'
$checksum32 = 'fe2466e54747793f00066f3b6e28317916641b7446967b47b3cda2a29aae0391'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper702_x64-install.exe'
$checksum64 = '7d62dfe6cf9d8255d71dfbd77bb1fd8ae64f8ce56ead432bb371090b5246be42'

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
