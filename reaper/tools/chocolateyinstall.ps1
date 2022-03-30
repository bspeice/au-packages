
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper653-install.exe'
$checksum32 = 'fdf2db27cfc8ec1672056af9650a59ea0f4196e507e50c6369fcbca73432b93c'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper653_x64-install.exe'
$checksum64 = '3db1321d54c5a17f27a639051fa960339443a46d88249cf6882bafccb5469790'

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
