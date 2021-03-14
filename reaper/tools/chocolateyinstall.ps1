
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper625-install.exe'
$checksum32 = '34d2434f6a7d659091444555dd843616708244eba47db8f4a95e4a59e8a00055'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper625_x64-install.exe'
$checksum64 = 'dd680120aa7767cc29d5e7654a55b4025864b56034f5806af2bc494dd7607e51'

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
