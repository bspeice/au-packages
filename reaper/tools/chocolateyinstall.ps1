
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper715-install.exe'
$checksum32 = '05a27e21a0194e0b5ac0af3fe1ba6f6aa6866e874ab2fd7126421139ffb80c59'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper715_x64-install.exe'
$checksum64 = '2794d6210acbc3a694dde7079d4badf9df39565118aa6a50478d3fe886dea723'

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
