
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper635-install.exe'
$checksum32 = '71a78467097ead3e21544f3f18c2dea6c5a39749fe26933841cc990f88b98a18'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper635_x64-install.exe'
$checksum64 = '298b6ed0ba9ec926372ae4417f4d8d2af75c1573de8ccc68fcbc009581cc42f7'

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
