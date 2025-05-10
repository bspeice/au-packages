
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper738-install.exe'
$checksum32 = '0ee4b5b4b803c66c47dbadfd9573d1b4253b3a7ca94a2348aac2a291afe02b27'
$url64 = 'https://reaper.fm/files/7.x/reaper738_x64-install.exe'
$checksum64 = 'bded945919c4f038122ce0783223e1fb305987c77e87f39f81c23c151440d1c1'

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
