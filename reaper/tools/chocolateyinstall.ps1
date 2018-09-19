
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper595-install.exe'
$checksum32 = 'a2e2864b62374d513dc84c34f43b85fd9a38f914b9b43c0e37933e3beec1f39c'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper595_x64-install.exe'
$checksum64 = '872763fdc779725d63ea54f77d030366bde53b3b36f0018236f51b3b59e8481f'

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
