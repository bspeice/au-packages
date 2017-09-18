
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://reaper.fm/files/5.x/reaper550c-install.exe'
$checksum32 = '575fe8529eb144d7cf4ba0b7d3e2efd07ccb04a80a8319f4810021ae6cd29b4e'
$url64      = 'http://reaper.fm/files/5.x/reaper550c_x64-install.exe'
$checksum64 = '22c439756463948876a6563e207e59e2e9771d3a998fb393c708cee8791b8be0'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'reaper*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'


  silentArgs   = '/S'
  validExitCodes= @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
