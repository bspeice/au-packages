
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://code.soundsoftware.ac.uk/attachments/download/2821/sonic-visualiser-4.5-win32.msi'
$url64 = 'https://code.soundsoftware.ac.uk/attachments/download/2823/sonic-visualiser-4.5-win64.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = $url
  url64bit       = $url64

  softwareName   = 'sonicvisualiser*'

  checksum       = '29bdce38e0a747cba55e6995bf21036225f8d73cc74f97bcf705b889f1c2cad9'
  checksumType   = 'sha256'
  checksum64     = 'fa8f7aebd66f2ae56104cfba9453efbe12a8d24f45555352d3b265d128983c8b'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
