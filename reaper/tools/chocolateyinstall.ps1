
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5983-install.exe'
$checksum32 = '39b359206398dc25dd33b434ef0cb0922a6af3f7f0e35a8f333e672fde4b47d8'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5983_x64-install.exe'
$checksum64 = 'f2c0f70c423995036ace801906b7a4aadf6c23457c5cea6f8603b239780f1361'

$packageArgs = @{
  packageName   = $packageName
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
