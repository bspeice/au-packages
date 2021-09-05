
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper636-install.exe'
$checksum32 = '88db9fcdfb1820d35f22b4beb8efa7b2b5845f33da1ea46048f3cc78befddba8'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper636_x64-install.exe'
$checksum64 = '8421cecbf52cfb3557508a92301b291a660dcdd64ce8d4ea45042e6a255051a3'

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
