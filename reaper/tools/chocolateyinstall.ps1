
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5982-install.exe'
$checksum32 = '585584329b497c75d4909201b3941088c16df6b5e348c12d00456a025901ecdd'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5982_x64-install.exe'
$checksum64 = '635b17d35fb8191001695f580d44c0273343aa5ef8f4eb1ca2e272ef1a861491'

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
