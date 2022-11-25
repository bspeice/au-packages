
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://code.soundsoftware.ac.uk/attachments/download/2840/sonic-visualiser-4.5.1-win32.msi'
$url64 = 'https://code.soundsoftware.ac.uk/attachments/download/2839/sonic-visualiser-4.5.1-win64.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = $url
  url64bit       = $url64

  softwareName   = 'sonicvisualiser*'

  checksum       = 'b45fdd1903a90a52285373070a895e8b2bc992e0539da15366aa23e80d044b88'
  checksumType   = 'sha256'
  checksum64     = '551f1409e989ca29fe0716621726ffa0498abd06edb075277b4c4494e6d13f25'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
