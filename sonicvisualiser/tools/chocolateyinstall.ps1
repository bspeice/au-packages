
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://bintray.com/sonic-visualiser/sonic-visualiser/download_file?file_path=sonic-visualiser-4.1-win32.msi'
$url64      = 'https://bintray.com/sonic-visualiser/sonic-visualiser/download_file?file_path=sonic-visualiser-4.1-win64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'sonicvisualiser*'

  checksum      = 'ade263a1933991e3f9e29f4aba8df7ef63033758d80286c5b4d4cff4676edb24'
  checksumType  = 'sha256'
  checksum64    = 'f30177f6d69898476ba423efa67d9e57fdc5b84e9bf6389b338229bbc3b71a8a'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
