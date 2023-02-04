
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper675-install.exe'
$checksum32 = '47b7226c1cd5854623803f84e7461466018c004d1bc0679e063eafdc67c8b4e2'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper675_x64-install.exe'
$checksum64 = '3bf72e0733d3783f3b453d4ccfe343f10e13a17e0b9b0fef224c20c40c15001e'

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
