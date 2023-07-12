
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper681-install.exe'
$checksum32 = '6c5d9075f542234dfc3e5a4aeaf8d0667d01349b258b326ab80645605230789f'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper681_x64-install.exe'
$checksum64 = '1910b2ba20a9ec55a2a1624be11deb33d773bbe679bd5cef614074a80577a072'

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
