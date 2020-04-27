
$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://capnproto.org/capnproto-c++-win32-0.8.0.zip'
$checksum32 = 'e008fa75e75c39cafbadca07d2054d579477daee82e4f7a39784f27cfd2e7c77'

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
