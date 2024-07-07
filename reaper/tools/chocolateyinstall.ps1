
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper718-install.exe'
$checksum32 = 'bcc878a9a9a5099537efac1be04752be8c54710e6a96207eea9996fe0e524d29'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper718_x64-install.exe'
$checksum64 = '66d98baccf204383ee64d744e01305be78428acb6218042f8bdea6bcda82a8b6'

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
