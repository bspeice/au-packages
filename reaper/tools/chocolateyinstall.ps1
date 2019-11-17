
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/5.x/reaper5985-install.exe'
$checksum32 = '94ab4328352b45bafb23c6cad51c96f6150411620a5555a61d88c80f30b84a6a'
$url64      = 'http://dlcf.reaper.fm/5.x/reaper5985_x64-install.exe'
$checksum64 = 'e323ffed09be0e4d7053b7d54a979ce05356d8a896706d839445cddb7759c144'

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
