
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper670-install.exe'
$checksum32 = '65bdff49406e86237c2a1364518d31dfdace5a70ba105409ef5dd107bba42ee2'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper670_x64-install.exe'
$checksum64 = '47e3c4f24caf60f13ff72e24d9044af7cebc72d73f95f348725779989ed4b2a8'

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
