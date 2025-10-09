
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper748-install.exe'
$checksum32 = '01def15ff72bb2b8c45a043d93292d1ddb4b5e9691fd4027e93742e267e90dc8'
$url64 = 'https://reaper.fm/files/7.x/reaper748_x64-install.exe'
$checksum64 = 'a0f25382ba47f97f8de1159c0caf62cdc2ccf7265082172d32618428c510928e'

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
