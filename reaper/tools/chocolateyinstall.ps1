
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper612c-install.exe'
$checksum32 = '8fba74a1d5bf269df2e7b289b2f8897ff195cbfccd3bb8ef9fec2d119fd98c1f'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper612c_x64-install.exe'
$checksum64 = '439672c974190557a46abfb5c8275ffa2196bb6dafaea6b97477149cae7b17e5'

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
