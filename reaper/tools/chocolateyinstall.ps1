
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper610-install.exe'
$checksum32 = '9bdf15183e39214db0e2129833b25ffcea535ab00ddf4478e0fb84f317df7489'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper610_x64-install.exe'
$checksum64 = '62c4c724a4c2e33459846bcca0defe7de3c6807f58241db4c20c6423ae988bb6'

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
