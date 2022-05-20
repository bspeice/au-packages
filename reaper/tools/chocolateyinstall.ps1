
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper658-install.exe'
$checksum32 = '12945bf5e4c50462e517dc542079e8f0980f3daddfee2953d4d9bad01166f42d'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper658_x64-install.exe'
$checksum64 = '1ecf40d295ebd6473d7120ca6c1b5465429b3c832b7a51aeb419e88c4a9cec92'

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
