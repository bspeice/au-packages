
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

  checksum      = 'BE7321ACFBDE491EB8086451DD25062670376B9AE500421D34809F1EFA0BAF41'
  checksumType  = 'sha256'
  checksum64    = '2265025A3F8D55177F6A9AFB904089D1700EB784B92F453309A8F86482BE3045'
  checksumType64= 'sha256'

  silentArgs   = '-q'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
