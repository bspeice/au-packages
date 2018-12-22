
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5965-install.exe'
$checksum32 = '21032d98a89b2ec4dd514945595d76553f75e1404ec75083e05080a42c4e0575'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5965_x64-install.exe'
$checksum64 = '6a749d156dfc75e3aef61c6440aba6b5748ddb38137fe11b8da2d3903eac44b4'

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
