
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper703-install.exe'
$checksum32 = '4e201cb33b3e521880708283a744192da635000f9c20bc44e9e9434f64cc97d9'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper703_x64-install.exe'
$checksum64 = '52b522798aedefbd81844e30ad21dbf4015c64cfa865b090b122b15a2f049d54'

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
