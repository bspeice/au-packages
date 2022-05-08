
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper657-install.exe'
$checksum32 = '75395c230e904f9edbb8296121f3a7f6bb4e72fc23d460ad138994add85193e6'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper657_x64-install.exe'
$checksum64 = '1d6611e37c4e5a701621da0af6f83a5db634b3a37f83cf7f800280d3c92609af'

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
