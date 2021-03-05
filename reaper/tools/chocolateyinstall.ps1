
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper624-install.exe'
$checksum32 = '19bb1ae738b86b76b8ad36671a205c61cbb4f37be7f13d5e67fd8d9ecff03ff3'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper624_x64-install.exe'
$checksum64 = 'b05c009f5394d51c9c9fdab74341bac029fbc1087dd41be33dfedf4a7a35a6cb'

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
