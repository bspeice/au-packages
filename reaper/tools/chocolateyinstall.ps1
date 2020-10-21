
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper615-install.exe'
$checksum32 = '6293ddf14382b3a54d1080037804b4288a61812bb5989038f2e07620e06af4cd'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper615_x64-install.exe'
$checksum64 = 'edfa61d39905b047e7853017f293271f5ed84eabd717da9833588774ebd7dd29'

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
