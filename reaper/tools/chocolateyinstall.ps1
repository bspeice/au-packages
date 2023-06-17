
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper680-install.exe'
$checksum32 = '6284df60970df94ce18a815a9bf7f279acd10cb9265c68457729880b3e58a558'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper680_x64-install.exe'
$checksum64 = '1288c18a00468822374ced5f5ef735b58ac595a23bbb6706cac6557f313231ef'

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
