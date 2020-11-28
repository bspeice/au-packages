
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper616-install.exe'
$checksum32 = '2cd5f26c633527f14ff5fa6491e2aa9b22219d060a7434a552d4f4bb64fcc60f'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper616_x64-install.exe'
$checksum64 = 'ab9908c8480991214761982302bc4fa3c67452367fbe5de6a83b633baa2636fa'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
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
