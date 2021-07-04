
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper630-install.exe'
$checksum32 = '97a7b258cfeae3dcae82f4733b51995abcdaaf5f3128bc37b2b12a3eb20e86f5'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper630_x64-install.exe'
$checksum64 = 'd8c3856f2d2b3f9eb0dfcfb9cb743c64f410379de28085acbdf7d41011d5a783'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'reaper*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'


  silentArgs   = '/S'
  validExitCodes= @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
