
$ErrorActionPreference = 'Stop';

$packageName= 'notable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/google/flatbuffers/releases/download/v1.10.0/flatc_windows_exe.zip'
$checksum32 = 'e6efb66c5c531856506f11799956f03c2397ef2ba37538558dbd7ca11fdb9faa'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url32

  softwareName  = 'Flatbuffers*'

  checksum32    = $checksum32
  checksumType32= 'sha256'

  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
}

Install-ChocolateyZipPackage @packageArgs
