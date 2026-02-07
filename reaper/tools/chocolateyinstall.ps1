
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper761-install.exe'
$checksum32 = 'a5cfe1acedfae1d6f6832f0f472241f951aa63b82f7375ef2f90bb7b50d65822'
$url64 = 'https://reaper.fm/files/7.x/reaper761_x64-install.exe'
$checksum64 = '49a15b316df92e35bcc7f690adc14df3349c5b6d347e431e0eba6b74e2399f76'

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
