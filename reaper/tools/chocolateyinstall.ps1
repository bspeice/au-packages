
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/7.x/reaper725-install.exe'
$checksum32 = 'fd96c0463489b99a22a9d34056caa4e0b86bef52035f81f5e9f4f3f979752f07'
$url64 = 'https://dlcf.reaper.fm/7.x/reaper725_x64-install.exe'
$checksum64 = '2294aefd0de4d577c465b53518c3a275a83fee45b56506f97b8d4b2930b7f278'

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
