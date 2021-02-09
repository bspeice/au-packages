
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper623-install.exe'
$checksum32 = 'bdc3547d62d4e932f782d456b083fb8ed0109b1a514f00cc9da24c5e578a92a1'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper623_x64-install.exe'
$checksum64 = '9f7337c6072f2afc5f3a1862fb1f329cc8cc4ea213b6b32d6b35c42bc5413b54'

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
