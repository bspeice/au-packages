
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper590-install.exe'
$checksum32 = 'eccb93919d97245beb427f4e5d58f62bb329e4cd9d7fa260f6fa36d510dad1cd'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper590_x64-install.exe'
$checksum64 = '97c22daff13d77744b2ab9722295167794d0f2dea0c9dae176231fe46b2b8dbe'

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
