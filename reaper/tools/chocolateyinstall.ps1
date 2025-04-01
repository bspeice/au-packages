
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper735-install.exe'
$checksum32 = 'b499dfd7bd896ffcc70a59d28d2ab7437dcabb7a86a5056deed89c867d7f9ae1'
$url64 = 'https://reaper.fm/files/7.x/reaper735_x64-install.exe'
$checksum64 = '148e0928ebbe703a40e25dbd83fb9da8f8cec25ffc78ccc7914576b64c1bce06'

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
