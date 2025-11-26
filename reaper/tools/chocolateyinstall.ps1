
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper754-install.exe'
$checksum32 = '96ae6d6f16d348c1cb05bd2f8e4e11d07bfee2485a4c365fa576d8c0bf001475'
$url64 = 'https://reaper.fm/files/7.x/reaper754_x64-install.exe'
$checksum64 = '8985b64d9db92bd78599a1c8dce913a35516acb641da6777564bf3ac6b6507b5'

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
