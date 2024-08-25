
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper721-install.exe'
$checksum32 = '5a54657c0bee2f45eeffc571c6f5de6e82092e5500594f46fd3cddbd1b3d98d9'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper721_x64-install.exe'
$checksum64 = 'b53cf43be8425c070428a4ea8c30f1f791a43b355ac7492bcf18b6af26fe7084'

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
