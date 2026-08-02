
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper778-install.exe'
$checksum32 = 'c0f777d420fa4e0b460352b78fa6910815df21d4e4769d4846565364be18281c'
$url64 = 'https://reaper.fm/files/7.x/reaper778_x64-install.exe'
$checksum64 = 'e7ad77bdd572c35d205034f871181c7b4d9a4110798131b60acd54cd44453947'

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
