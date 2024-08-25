
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/helge17/tuxguitar/releases/download/1.6.4/tuxguitar-1.6.4-windows-swt-x86_64-installer.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = $url64

  softwareName   = 'tuxguitar*'

  checksum64       = 'b40984b5d9530c254f1e942a0f48f976892b7ae07f7bf205212efc45aba3e3ef'
  checksumType64   = 'sha256'

  silentArgs     = '--mode unattended --unattendedmodeui none'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
