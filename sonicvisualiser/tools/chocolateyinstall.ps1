
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://bintray.com/sonic-visualiser/sonic-visualiser/download_file?file_path=sonic-visualiser-4.3-win32.msi'
$url64      = 'https://bintray.com/sonic-visualiser/sonic-visualiser/download_file?file_path=sonic-visualiser-4.3-win64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'sonicvisualiser*'

  checksum      = '71a08c990bea78c1475d633bc13d76b6b0e1fb732fabc821c2fcb9b93273f414'
  checksumType  = 'sha256'
  checksum64    = '1899c276d6c3d9689853f0c9d7ee21d7d7eca7e6e77b2ea66106e0bd54de96b0'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
