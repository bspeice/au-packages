
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://sourceforge.net/projects/impro-visor/files/Impro-Visor%2010.2%20Release/Impro-Visor_windows_10_2.exe/download'
$url64      = 'https://sourceforge.net/projects/impro-visor/files/Impro-Visor%2010.2%20Release/Impro-Visor_windows-x64_10_2.exe/download'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'impro-visor*'

  checksum      = 'be7321acfbde491eb8086451dd25062670376b9ae500421d34809f1efa0baf41'
  checksumType  = 'sha256'
  checksum64    = '2265025a3f8d55177f6a9afb904089d1700eb784b92f453309a8f86482be3045'
  checksumType64= 'sha256'

  silentArgs   = '-q'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
