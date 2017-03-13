
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://reaper.fm/files/5.x/reaper535-install.exe'
$checksum32 = '0b78f54b0b7fe919d43375f4f08c24c5287b2d5f541a4f799ce88872febc02dd'
$url64      = 'http://reaper.fm/files/5.x/reaper535_x64-install.exe'
$checksum64 = '298e05c72134be810c3a10cea3986e2d358085a621c9979257438fa6a4fb0d1a'

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
