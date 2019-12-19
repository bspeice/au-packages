
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://bintray.com/sonic-visualiser/sonic-visualiser/download_file?file_path=sonic-visualiser-4.0.1-win32.msi'
$url64      = 'https://bintray.com/sonic-visualiser/sonic-visualiser/download_file?file_path=sonic-visualiser-4.0.1-win64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'sonicvisualiser*'

  checksum      = 'F31BEA7792B0779CD0FDDCAA24439423216B74DE781D42AFE8DB0B9C8CF4DCDC'
  checksumType  = 'sha256'
  checksum64    = 'C53635C78456BF6B654157C1B3DC9CA7E8AC36B57F191ED3E2DD59FD176FA316'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








