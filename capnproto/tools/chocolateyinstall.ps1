
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://capnproto.org/capnproto-c++-win32-0.10.1.zip'
$checksum32 = '6a8ee3fe6d7289a31ca95a626926b2af885ee4352a4cc6d10721d8756d1ea33a'

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
