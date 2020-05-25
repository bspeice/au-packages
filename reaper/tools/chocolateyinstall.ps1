
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper611-install.exe'
$checksum32 = 'f0a65dbd7d7421636ecde778f0ebcfaa517a1998bbb160c1a044376b1d051969'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper611_x64-install.exe'
$checksum64 = 'd42c77691dee347fc15cb25ebe3ade4619d40e27165609214d6fb64afed6a457'

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
