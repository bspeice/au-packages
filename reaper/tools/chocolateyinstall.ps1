
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper655-install.exe'
$checksum32 = '188006850e36c1642d654c2c357ee98384b4526db2fa7f8df73c3a592e2eb90b'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper655_x64-install.exe'
$checksum64 = '045e7c8a1f8df35191e7abdbdc365e08ad2e2c20222e6c3624f366ce468634eb'

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
