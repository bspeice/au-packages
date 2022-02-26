
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/TuxGuitar-1.5.5/tuxguitar-1.5.5-windows-x86-installer.exe/download'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url

  softwareName   = 'tuxguitar*'

  checksum       = '8158e1009b54f5718270d99e21219a441b9b9c1245d2669759ccdeab0211244a'
  checksumType   = 'sha256'

  silentArgs     = '--mode unattended --unattendedmodeui none'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
