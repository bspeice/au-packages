
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://code.soundsoftware.ac.uk/attachments/download/2849/sonic-visualiser-4.5.2-win32.msi'
$url64 = 'https://code.soundsoftware.ac.uk/attachments/download/2848/sonic-visualiser-4.5.2-win64.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = $url
  url64bit       = $url64

  softwareName   = 'sonicvisualiser*'

  checksum       = '79845c404523990dd6baabdc7ac9ba25156b34d73a565d7ebdcb6f3aae8ec02f'
  checksumType   = 'sha256'
  checksum64     = 'fc6bd67628b982a7e3e80faaea25e3ddfe991dec167f0b86002b6545a43d8770'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
