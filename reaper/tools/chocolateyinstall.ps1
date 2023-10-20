
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper701-install.exe'
$checksum32 = '03c3888fcff93dd438662c2ec2b6d86168f8b0ce1fb20d3f8157804f5e370c0a'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper701_x64-install.exe'
$checksum64 = 'fccc7e551fe831039d3aa27f3d554ba00b405c1f69c2c623f888c569d4ad4ef4'

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
