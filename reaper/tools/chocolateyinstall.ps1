
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper757-install.exe'
$checksum32 = '082b6d18219165d1b67c5cb311411a6f39440dde4075b4d9445704d599548e2e'
$url64 = 'https://reaper.fm/files/7.x/reaper757_x64-install.exe'
$checksum64 = 'f809459724a07831acb1e3a9b96de1a3e7d54264bebf8b1cd8211b50a31bbfe8'

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
