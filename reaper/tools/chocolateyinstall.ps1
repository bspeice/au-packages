
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper674-install.exe'
$checksum32 = 'd97e3ae949ec34deb9881dccf97b0024473690f385ad6f57a85f35f74e180f30'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper674_x64-install.exe'
$checksum64 = '4b76fbb34a387db599a356835fddde101a4e88da3d5620dbea445e77f09c5f9f'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url32
  url64bit       = $url64

  softwareName   = 'reaper*'

  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'


  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
