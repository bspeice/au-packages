
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper645-install.exe'
$checksum32 = '223430c28e5a56168676957aae09702ad4386c95ae033c3bf1085cb83d6019ab'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper645_x64-install.exe'
$checksum64 = '8ad3d3b37a850f1f5cb8da28657cb2e7aa4f9d68d675b391cc6cd512316bc549'

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
