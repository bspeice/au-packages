
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper742-install.exe'
$checksum32 = '2b3c10e0d2caff16d9063a503051b080d39cc562cc4b35a2536a4a2b655acaad'
$url64 = 'https://reaper.fm/files/7.x/reaper742_x64-install.exe'
$checksum64 = '46110fd85cb0d4830a13e8be748bdcd6ca7dbcc7b1717e70f4d2530d9afbf05d'

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
