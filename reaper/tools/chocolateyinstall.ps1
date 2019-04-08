
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5974-install.exe'
$checksum32 = 'c94f75386db16425581a52a4ce2481cea4660c63f2b8749de65513e784e13b6e'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5974_x64-install.exe'
$checksum64 = '8c3d5e7aec1eeb15589778251869dc786f62e4bdcae71a5122b0c996f3726db3'

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
