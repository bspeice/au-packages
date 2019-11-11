
$ErrorActionPreference = 'Stop';

$packageName= 'notable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/fabiospampinato/notable/releases/download/v1.8.1/Notable.Setup.1.8.1.exe'
$checksum32 = '981d4bc68911466fa77dfbe7539d6a38dc07986ff8aa9349db3f7f82a5c00b72'

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
