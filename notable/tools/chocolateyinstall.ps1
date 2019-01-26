
$ErrorActionPreference = 'Stop';

$packageName= 'notable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/fabiospampinato/notable/releases/download/v1.2.0/Notable.Setup.1.2.0.exe'
$checksum32 = 'a00a1034340352d9ead41b2dbe4a4998fb3e2154cc8c592e8719ae11fb4f72b7'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url32

  softwareName  = 'Notable*'

  checksum32    = $checksum32
  checksumType32= 'sha256'


  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
