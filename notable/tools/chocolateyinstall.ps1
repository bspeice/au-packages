
$ErrorActionPreference = 'Stop';

$packageName= 'notable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/fabiospampinato/notable/releases/download/v1.1.0/Notable.Setup.1.1.0.exe'
$checksum32 = 'e629975945b1e52d808099e09387bc312ea24f814e3888a2c34e74c943e6049e'

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
