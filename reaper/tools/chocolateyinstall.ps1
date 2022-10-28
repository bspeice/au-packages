
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper669-install.exe'
$checksum32 = '896cb609909a844af611356b94a99c2e5293eebce6d8d97361e12147a8486eab'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper669_x64-install.exe'
$checksum64 = 'b364f1feedbb43cf67ad0ebd06d203fdedc0541009c83ec474a85c86dabe00f2'

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
