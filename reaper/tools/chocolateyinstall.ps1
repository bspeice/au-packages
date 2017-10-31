
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper561-install.exe'
$checksum32 = '0416fa309f180be2c89730c2c7a93de444c8809ed19e4bf7753f22e93fa74bed'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper561_x64-install.exe'
$checksum64 = '4e88896e59b774cc5af5c344f3f22c11c963624c8843124bffa98ac38bd3b71c'

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
