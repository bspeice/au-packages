
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper632-install.exe'
$checksum32 = '2fbaa1553625f663afc0a1fbecfcb2bd641bd2affba54fc9bce3120d8e7fe4ca'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper632_x64-install.exe'
$checksum64 = 'c22167cdaaa955e429b16b0af58ad498a5ce884cca1b08de77e6f87eb57d3a12'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'reaper*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'


  silentArgs   = '/S'
  validExitCodes= @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
