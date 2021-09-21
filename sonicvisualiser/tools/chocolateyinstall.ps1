
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://code.soundsoftware.ac.uk/attachments/download/2815/sonic-visualiser-4.4-win32.msi'
$url64 = 'https://code.soundsoftware.ac.uk/attachments/download/2814/sonic-visualiser-4.4-win64.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = $url
  url64bit       = $url64

  softwareName   = 'sonicvisualiser*'

  checksum       = '8b7867d339c25c324d714c85b8e363edded9c98ca2c08e5fb9bbbbd9d4d11df9'
  checksumType   = 'sha256'
  checksum64     = 'd8f946d96435622bd2f3930b8756d7be0026db375f73707dd285e0a813018609'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
