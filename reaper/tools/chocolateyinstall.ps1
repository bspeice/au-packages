
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper739-install.exe'
$checksum32 = '9e255127aeb0e0a37b2508fd44a045d7c87f8560a9dfdc0c4761d6b611387b85'
$url64 = 'https://reaper.fm/files/7.x/reaper739_x64-install.exe'
$checksum64 = '894c6c943d2d7fb9843f7eff6f5f573919b08381961d67f1abe4befed7098c21'

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
