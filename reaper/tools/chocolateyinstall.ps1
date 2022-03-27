
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper652-install.exe'
$checksum32 = '9634ee748c3906d00ea7627e6a279608c22608ce35b52abf369c2e7f3c56faad'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper652_x64-install.exe'
$checksum64 = 'e3e2893eb856a88b17a876fc08fcbf6b93ad1f5c70c023434e7d732928046e23'

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
