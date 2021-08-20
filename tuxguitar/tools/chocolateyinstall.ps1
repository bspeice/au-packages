
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/TuxGuitar-1.5.4/tuxguitar-1.5.4-windows-x86-installer.exe/download'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url

  softwareName   = 'tuxguitar*'

  checksum       = 'bf893887619639c64dff105a2f3edd639329af997db27151806a1a103e09d1fe'
  checksumType   = 'sha256'

  silentArgs     = '--mode unattended --unattendedmodeui none'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
