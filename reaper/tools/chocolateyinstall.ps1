
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper638-install.exe'
$checksum32 = '0e9f4abe1a9ba44c9a243322d697472057c77decd4d6318e5ec8e1bd58a40083'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper638_x64-install.exe'
$checksum64 = 'd61e6986df2a97911af3393616441789318958ed4217894e74c89ee41a8ad2e1'

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
