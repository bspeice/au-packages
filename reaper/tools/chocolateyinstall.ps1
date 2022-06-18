
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper661-install.exe'
$checksum32 = 'f51241635fb2e6eac305fb79286e9b049c096e5b538d84311ee8a2d91543828e'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper661_x64-install.exe'
$checksum64 = '9b60269e9872456bfd5db67c372fdc91cd8ba1eca644bd50256731a077887df0'

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
