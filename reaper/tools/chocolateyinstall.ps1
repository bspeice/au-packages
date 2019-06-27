
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5979-install.exe'
$checksum32 = 'fc8105e9c6715e4dd5be74420c67d1e37cb47a2208de46faf307eb939f5d9a38'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5979_x64-install.exe'
$checksum64 = '314affed11266a7b7c430ee66f3ef27827dd1516f1121c27d4f7d9c335bf433c'

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
