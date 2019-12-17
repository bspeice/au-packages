
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/TuxGuitar-1.5.3/tuxguitar-1.5.3-windows-x86-installer.exe/download'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'tuxguitar*'

  checksum      = '2b58d5e79d7690f2c0896d00a68213dd13ca30798183e3d0c214ad5f11c90e7c'
  checksumType  = 'sha256'

  silentArgs   = '--mode unattended --unattendedmodeui none'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs










    








