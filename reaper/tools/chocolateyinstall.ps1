
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper577-install.exe'
$checksum32 = 'e825419c02d908c97dfedee2a821273315582dff37852eab5fd995068b93ac5e'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper577_x64-install.exe'
$checksum64 = 'b7f7bd9f19fae349ef2bf8f823e5337447f583d74f03ef6c8bfd66a81c67f073'

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
