
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper626-install.exe'
$checksum32 = 'a748a60d9e5069f3c63a3ed37b827a3c9ab3428c5a99a9d140f8557a80a6907f'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper626_x64-install.exe'
$checksum64 = '93ada4a2f273261e361bf287bc2857b782f0065e5db78ef7c1793fe400e22738'

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
