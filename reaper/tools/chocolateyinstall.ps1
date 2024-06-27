
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper717-install.exe'
$checksum32 = '26678c8ec676728682ae62f4e46ed628d5bc28269e6bd08cec367097424cfb71'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper717_x64-install.exe'
$checksum64 = 'e45a31bb565bd2b9d14a8631ac85c02fb335f9a55bfc31ba95d6836bcaf393ba'

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
