
$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/google/flatbuffers/releases/download/v1.12.0/flatc_windows.zip'
$checksum32 = '08588515fbd1acca672faac27e4a670e3359b4497a6a87608d96031b7652d470'

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
