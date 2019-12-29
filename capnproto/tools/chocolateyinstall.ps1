
$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://capnproto.org/capnproto-c++-win32-0.6.1.zip'
$checksum32 = '920eb3424fc6e9aca5ec4599adeceacc45fdbc0f8db31d3429fbf341f80e5a59'

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
