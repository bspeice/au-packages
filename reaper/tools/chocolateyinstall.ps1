
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5971-install.exe'
$checksum32 = '0a3f3385928eb8e85552dc5dd846e514e515cc5f2028e5e1609c9f871348f0ca'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5971_x64-install.exe'
$checksum64 = '23cd758407c3d361910ec2c80fa95d6da3579c0f7e1bf6abe144decc98d83409'

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
