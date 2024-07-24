
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper719-install.exe'
$checksum32 = 'd1a2453e182aa8aac55d14b659bd5f8a78dc645b592ab08dd13f8328501c8b91'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper719_x64-install.exe'
$checksum64 = 'da4f9d46a493caaa328c1cad4215fb5ad099780d6a18703fcb99083786963de8'

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
