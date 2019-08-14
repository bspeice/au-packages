
$ErrorActionPreference = 'Stop';

$packageName= 'notable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/fabiospampinato/notable/releases/download/v1.7.2/Notable.Setup.1.7.2.exe'
$checksum32 = '961a2ab755e75eeaa186d5da094cc3f40bf5802ed6c8be9ff11f01330977f196'

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
