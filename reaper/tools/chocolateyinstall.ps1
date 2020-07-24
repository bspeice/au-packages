
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper613-install.exe'
$checksum32 = '09edf6865bee7f4ccb86cd97671aa23bfab615ec081d996a3d51e29c845385f9'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper613_x64-install.exe'
$checksum64 = 'f2d8628f60425c58ac2f134e91c1c89bc48db6f239763595161cb6986f4a231a'

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
