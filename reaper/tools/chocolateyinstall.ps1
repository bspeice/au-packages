
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper650-install.exe'
$checksum32 = 'd163f9940e65468452445820010f9928083f5a2dadb50f29659f6b94bfd72709'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper650_x64-install.exe'
$checksum64 = '6928324f1f7c5b0e6137ee070c75350a5bf3ff53c5d5f17bafaa0a5289fe463c'

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
