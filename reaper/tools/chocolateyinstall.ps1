
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper608-install.exe'
$checksum32 = '7a703294c0e6f2a91bd19c6064f16a1560626f8a31d4115b64e395ab00b8b2c5'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper608_x64-install.exe'
$checksum64 = '17bde574284471d7ca171f101cbe2e0c507e61e9c42b1b190d25eb11a49b6a8f'

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
