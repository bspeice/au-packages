
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper602-install.exe'
$checksum32 = 'd612ea4297b8b9174c541972854955db6d737773ba2f00688fece95f8a1fd711'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper602_x64-install.exe'
$checksum64 = '18aad54087f90b8185d2d2cf9522b1b0e2e2480061675098069793d733e87087'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
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
