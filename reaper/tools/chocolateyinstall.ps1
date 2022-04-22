
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper654-install.exe'
$checksum32 = '92b6000858e8c636fdb2766480b616cae59edda1a266103cc686f45074c08ce7'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper654_x64-install.exe'
$checksum64 = '185eeca81f139b1d6d146c612eebc5b91fab837b56952202f185f2346c5f9629'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url32
  url64bit       = $url64

  softwareName   = 'reaper*'

  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'


  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
