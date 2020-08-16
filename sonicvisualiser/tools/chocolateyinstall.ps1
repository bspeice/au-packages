
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://bintray.com/sonic-visualiser/sonic-visualiser/download_file?file_path=sonic-visualiser-4.2-win32.msi'
$url64      = 'https://bintray.com/sonic-visualiser/sonic-visualiser/download_file?file_path=sonic-visualiser-4.2-win64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'sonicvisualiser*'

  checksum      = '5923c1932c7a9051c68a503b70147108bc7aead06bc06d1aa476f5a821fafc77'
  checksumType  = 'sha256'
  checksum64    = 'eb759f4a48b97320d5376364816cd2993ed4a5774f3b7f5658da499480dd110b'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
