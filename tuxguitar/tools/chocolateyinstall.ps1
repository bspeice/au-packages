
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/TuxGuitar-1.5.6/tuxguitar-1.5.6-windows-x86-installer.exe/download'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url

  softwareName   = 'tuxguitar*'

  checksum       = '42d7312406948c9c6f6002a5597e9e5fceb3920a6cc8e540231dc42b543116d1'
  checksumType   = 'sha256'

  silentArgs     = '--mode unattended --unattendedmodeui none'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
