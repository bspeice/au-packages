
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper605-install.exe'
$checksum32 = '7e9475003801af352af9883f29151ce37a04de55415c5033461b85aec0b84c6c'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper605_x64-install.exe'
$checksum64 = '98f8cfdb3cd257882ecb8f85ac10c8e5ee3c5cf982504d0a8fc35ddf22993833'

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
