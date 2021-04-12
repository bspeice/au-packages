
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper627-install.exe'
$checksum32 = 'b2f5e1f55082678ba0a53b6bb354bc1c068f402ae6d9a68923086daa53a851cc'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper627_x64-install.exe'
$checksum64 = '286dc2c3fd0b574778744912961dd774d4e14abb171b906ca85cb32795a924cf'

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
