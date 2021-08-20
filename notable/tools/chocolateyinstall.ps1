
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/notable/notable/releases/download/v1.8.4/Notable.Setup.1.8.4.exe'
$checksum32 = '85781c48957b459ef417cb553a704fa205e81cbfba937666846d78103be8b952'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url32

  softwareName   = 'Notable*'

  checksum32     = $checksum32
  checksumType32 = 'sha256'


  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
