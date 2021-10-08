
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://capnproto.org/capnproto-c++-win32-0.9.1.zip'
$checksum32 = '0fdd8df285272c966947dc8bea6fb62a06269182a415ae76ef7b88ab3c200e76'

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
