
$ErrorActionPreference = 'Stop';

$packageName= 'notable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/fabiospampinato/notable/releases/download/v1.7.3/Notable.Setup.1.7.3.exe'
$checksum32 = '1acb8246c7a6fa645831d2bee658767097d72610af889b0e53487cca1c0a9cb5'

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
