
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://capnproto.org/capnproto-c++-win32-0.10.2.zip'
$checksum32 = '8cb9da6672b90c868d6bbbab726d05ec417a46f978d575b356cefe4c0f5c5813'

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
