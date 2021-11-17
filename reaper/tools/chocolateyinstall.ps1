
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper642-install.exe'
$checksum32 = 'cfedf59a9697fa12970fbf67308c42a932cfa1d63079ff360caa27c84910e442'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper642_x64-install.exe'
$checksum64 = '0daffd9fa377759996a6f779ac5341cc7d7e4287d658a11b0e0cf66ed396b7b6'

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
