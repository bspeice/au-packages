
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper678-install.exe'
$checksum32 = 'bcba2013aad99594d730f99ec9b599bb679288faad2fd5d9e5bd5304939c7769'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper678_x64-install.exe'
$checksum64 = '658750c396bee77106ba9d46619b66ee684dc0f6ed7b9a97839779c58d3d65fc'

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
