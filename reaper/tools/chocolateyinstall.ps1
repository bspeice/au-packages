
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper676-install.exe'
$checksum32 = 'bb8b23fb69160e0e2cfbe9d6db6b9d05fba0bd61c1ef79ff8155d38a254bbf90'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper676_x64-install.exe'
$checksum64 = '11680109a3b35c398ca684ea7438d0797996437394e14a83b423d9ae9b3ef9dc'

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
