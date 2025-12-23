
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$softwareName = 'capnproto*'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://capnproto.org/capnproto-c++-win32-1.2.0.zip'
$checksum32 = '0624f01bfa6eb08d0fa0b84cda00455448568ffe89734fd59da7b46b8729e83f'

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
