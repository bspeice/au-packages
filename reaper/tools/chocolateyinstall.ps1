
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper609-install.exe'
$checksum32 = '7e7764a2a1830d87313d27b30013604687bd6647e525256d5a02875f8acb9067'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper609_x64-install.exe'
$checksum64 = '25ff9ce8f25c444ba79b1303ba290d64a15eede046273d2e329d51146f5b900c'

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
