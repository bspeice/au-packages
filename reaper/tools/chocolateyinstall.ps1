
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper640-install.exe'
$checksum32 = 'def16afc3e809a786e996047957ce601677487400ff8ef49d257e36494fd8b58'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper640_x64-install.exe'
$checksum64 = '30df4982f73122857b4ff354d371f2117a18a8cea9861ea313dda61f08db92bd'

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
