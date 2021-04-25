
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper628-install.exe'
$checksum32 = 'e610dc384032edb962a5b6ee77e4feb1868da16d241821b9f4bc1e2543efa450'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper628_x64-install.exe'
$checksum64 = '64560f45cec4ceca26b30d17d7f78c72503a89333ff8537864e5341b0948eb2d'

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
