
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper664-install.exe'
$checksum32 = '107a2ae6f0d668212caccd3e6dd6f1418f8c38bf5cb00214bdef738d6365a017'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper664_x64-install.exe'
$checksum64 = 'a70b8871a8e4b84aafd16a57b14fbb0cd4411e48e1794df17e05065368348915'

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
