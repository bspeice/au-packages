
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper646-install.exe'
$checksum32 = '621f9855ad368df8dee64377fcca6d47521881ead4070e6d01020de6d997a3ed'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper646_x64-install.exe'
$checksum64 = '4c15aa049ccb2538d26990e8c4cdcc0c6d219b8dbb2f205827cec74253650838'

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
