
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper736-install.exe'
$checksum32 = '131520697e7d06ff0225d1a56a5d25d42f85f6af00cd4b58a9969f9b79c40ed3'
$url64 = 'https://reaper.fm/files/7.x/reaper736_x64-install.exe'
$checksum64 = 'df11baff22caa3e549859a104c2b974efec74cd38a967616c0d446d9fde2233d'

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
