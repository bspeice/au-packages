
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper631-install.exe'
$checksum32 = '2bdd89beebdf6c2f4b6e5f3804bdd6d5e818a643fe05f3b71d22b52d3b32e623'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper631_x64-install.exe'
$checksum64 = 'f6331642501d3ada4a045290ff782bd7972fb7a4c89ef8c1f4a616021f01b0e2'

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
