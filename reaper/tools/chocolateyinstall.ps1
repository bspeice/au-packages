
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper576-install.exe'
$checksum32 = '7dc3bf9f1adffd8cfe57bf1eec3d960f3a8d2d20358afcbdbc095ced57819431'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper576_x64-install.exe'
$checksum64 = 'b2e037ef344bf7c64916a9b4df02c25bfbe8515ef26332e391a6358ad271ff1e'

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
