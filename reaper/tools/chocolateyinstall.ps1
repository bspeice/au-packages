
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper707-install.exe'
$checksum32 = 'e0bcc89203fb5dda3d08cda663c3926899d7ee524375c3f7ec2bf3caf69a663f'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper707_x64-install.exe'
$checksum64 = '795bc4b2e04dd68c5b1b5f05f5202800b163eb5265696e530d5fcb22bebd6c27'

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
