
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper786-install.exe'
$checksum32 = 'e06826833a69d290846162069d2bfe06b1245e250aa3e18e614aadb4944de460'
$url64 = 'https://reaper.fm/files/7.x/reaper786_x64-install.exe'
$checksum64 = '02af50cc5c5417b92efde1e8fbdb4f37564e8545c3da409782ecbe7c0e90df76'

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
