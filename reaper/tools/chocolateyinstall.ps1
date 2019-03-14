
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5973-install.exe'
$checksum32 = 'ab6872b4f271c656a7c76c72fc5ffac1cc2aa6d23a8af4aff4bcc9c21713dfd3'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5973_x64-install.exe'
$checksum64 = 'eb2af16cedddef5e5441319293c29bbed3076147bae2e145ca4ef84d9067de30'

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
