
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper618-install.exe'
$checksum32 = '66a5b02671231b78437e61bc1b47643643775832aefce0ca24a7fe051a4808bd'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper618_x64-install.exe'
$checksum64 = 'fc84126b268376ed13c241bd36454bbdaa56ff6619afb73dfc093efe3481577c'

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
