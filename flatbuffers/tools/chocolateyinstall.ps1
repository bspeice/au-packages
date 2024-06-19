
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$softwareName = 'flatc*'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/google/flatbuffers/releases/download/v24.3.25/Windows.flatc.binary.zip'
$checksum32 = '6455f5b6272b908dad073721e21b11720a9fddbae06e28b5c75f8ec458e7fe30'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'ZIP'
  url            = $url32

  softwareName   = $softwareName

  checksum       = $checksum32
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
