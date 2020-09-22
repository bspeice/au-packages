
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper614-install.exe'
$checksum32 = '9e4728fd7b49beb04b4c2ecabadb064b2a443a8aff9a195e932442e1d282216d'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper614_x64-install.exe'
$checksum64 = 'e76c390d77014935d04d125a593558758ca3bd0e4cea468a591cee7482d6d08d'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'reaper*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'


  silentArgs   = '/S'
  validExitCodes= @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
