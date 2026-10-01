
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper781-install.exe'
$checksum32 = '6fcf2ac6e673d7b102cfc7909dba49cd443f4a0c49648f9b98a1c0d79f520da4'
$url64 = 'https://reaper.fm/files/7.x/reaper781_x64-install.exe'
$checksum64 = '7b02a901575c04d54a72f7091a432b0cc765b6e6ad967b84fbe9927cc19b4147'

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
