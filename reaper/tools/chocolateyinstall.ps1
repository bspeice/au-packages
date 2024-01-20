
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper709-install.exe'
$checksum32 = '12bd825c5d51cfbfb27336c63a88fd0ddd438a29c198b99fd6b763e376a7aff3'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper709_x64-install.exe'
$checksum64 = 'ee36578238262d314a5101bd208ddd7d0131f0f974561c500a5c352dcc49437a'

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
