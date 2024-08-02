
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://code.soundsoftware.ac.uk/attachments/download/2860/sonic-visualiser-5.0.0-win64.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = $url64

  softwareName   = 'sonicvisualiser*'

  checksum64     = '8f0486063e36274bf537daf0ea766d9c19492c259c8da57333c8bc73311af303'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
