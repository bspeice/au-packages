
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper766-install.exe'
$checksum32 = '9d2fef8110cbdfd63b0a1d55b6955a18ae920bda4f5b5588d783c60b2a4d5713'
$url64 = 'https://reaper.fm/files/7.x/reaper766_x64-install.exe'
$checksum64 = '7c641a9658eb65f9d8926d97ba183dd3af1f93a58ec820835b752abc1d5440d3'

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
