
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper647-install.exe'
$checksum32 = 'cfdcdb1dcc932a43c71bdc346efb38fed708cac7a4a875863427556bd1f43be4'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper647_x64-install.exe'
$checksum64 = 'aa7fd2c3d52fc628f55bbd2cc27680012af6d534293e072044937833720a4920'

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
