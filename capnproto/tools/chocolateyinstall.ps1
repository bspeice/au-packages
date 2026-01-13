
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$softwareName = 'capnproto*'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://capnproto.org/capnproto-c++-win32-1.3.0.zip'
$checksum32 = '2c503361f8bf26fa9e7caccb6db04d6b271d5f0ad3da0616cf40e9a51335c89c'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url32

  softwareName  = $softwareName

  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
