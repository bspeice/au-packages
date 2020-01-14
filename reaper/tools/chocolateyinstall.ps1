
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper603-install.exe'
$checksum32 = '323a9f64f4cac5de6c307e171bb9371cf76b280c1d1eca20d3e4f1ae8e340cb9'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper603_x64-install.exe'
$checksum64 = '3ed9a93483aca98964c058827bebff9847fe8704baf9af259bbdc26f43f6472b'

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
