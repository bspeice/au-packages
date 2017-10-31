
$ErrorActionPreference = 'Stop';

$packageName= 'reaper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://reaper.fm/files/5.x/reaper552-install.exe'
$checksum32 = '692804f0c47290f39ef8378373eae08f70b85af2e9e3e045a71a4538e1d48909'
$url64      = 'http://reaper.fm/files/5.x/reaper552_x64-install.exe'
$checksum64 = '50bebc49501529d51d4875c9f8b668429abff3cfd9b75da1622193b71f756ea0'

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
