
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://capnproto.org/capnproto-c++-win32-1.0.2.zip'
$checksum32 = '48a69e9c10350e2c90041e7b8d7a610a43889c178b6431145da62610c9b5435a'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url32

  softwareName  = 'capnproto*'

  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
