
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper774-install.exe'
$checksum32 = '0357d1d9714fbdcfda1bdf98efad20b55b0965170b18bc3d300bde92fc6b4a68'
$url64 = 'https://reaper.fm/files/7.x/reaper774_x64-install.exe'
$checksum64 = '14f53556f147105ddcd55190fe3bbae8fe6ade996db84c119f24e2b9e85861e6'

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
