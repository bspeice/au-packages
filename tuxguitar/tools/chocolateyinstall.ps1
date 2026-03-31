
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/helge17/tuxguitar/releases/download/2.0.1/tuxguitar-2.0.1-windows-swt-x86_64-installer.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = $url64

  softwareName   = 'tuxguitar*'

  checksum64       = '8fb76fbda90211c211688d0ea8028fa685302713e34f99140607d3973b07f69e'
  checksumType64   = 'sha256'

  silentArgs     = '--mode unattended --unattendedmodeui none'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
