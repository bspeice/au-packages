
$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://capnproto.org/capnproto-c++-win32-0.7.0.zip'
$checksum32 = '2d5dc7100818a22b2ae91618d379a394b3993e81d1b99c212fdc6c57245c3db2'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'ZIP'
  url           = $url32

  softwareName  = 'capnproto*'

  checksum      = $checksum32
  checksumType  = 'sha256'

  unzipLocation = Split-Path $MyInvocation.MyCommand.Definition
}

Install-ChocolateyZipPackage @packageArgs
