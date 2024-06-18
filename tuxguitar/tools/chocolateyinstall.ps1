
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/helge17/tuxguitar/releases/download/1.6.3/tuxguitar-1.6.3-windows-swt-x86_64-installer.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = $url64

  softwareName   = 'tuxguitar*'

  checksum64       = 'a62e1b045fa6b2b6b931b2d718a6b2b874f4b679aeef214b04d6bcebc5938575'
  checksumType64   = 'sha256'

  silentArgs     = '--mode unattended --unattendedmodeui none'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
