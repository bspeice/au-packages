
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper607-install.exe'
$checksum32 = '9df33a0afb4e31d583812fcee2b3994673d24f901edb7c65118207885cfd70c6'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper607_x64-install.exe'
$checksum64 = '0b3385893c551c25dbb98ece086055603ca1ee9c50db382167b37cc0ae3e556d'

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
