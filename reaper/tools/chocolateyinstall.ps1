
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper668-install.exe'
$checksum32 = '38dc7f2e59e50a239550ef9536dbb9592181edfc68786809e27fca8feb18a107'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper668_x64-install.exe'
$checksum64 = 'e1bd1ba3f08be9e30e18b90285a23a1854f62ba1c756c23cc77d61f254d7db4f'

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
