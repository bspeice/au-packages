
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper619-install.exe'
$checksum32 = '47e636b34ba5cb45794184dc71b5120680ae95b2810fe294cbf66d1e73876fdd'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper619_x64-install.exe'
$checksum64 = '37f72b4de427655735928573760bf2278a3b8e099a73e9612eed7cb0acac8bc6'

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
