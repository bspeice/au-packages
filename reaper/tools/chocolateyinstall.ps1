
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper677-install.exe'
$checksum32 = '2fe71a3a349b61ac0064923a249c89eafc5175fb51ef9b6d04c7db2abd2bc3b2'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper677_x64-install.exe'
$checksum64 = '82da049251b819fdc06344227841c93945d923646b97558c39ab534d86792f40'

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
