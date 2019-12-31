
$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/google/flatbuffers/releases/download/v1.11.0/flatc_windows_exe.zip'
$checksum32 = '1d23e84ac0d76ac5da6d6c7232c0564191e7c846b27c09d4650bd386888b4768'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32

  softwareName  = 'Flatbuffers*'

  checksum32    = $checksum32
  checksumType32= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
