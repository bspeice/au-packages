
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'http://dlcf.reaper.fm/6.x/reaper604-install.exe'
$checksum32 = '4b7055e728f3cc87dd9f9781ee91b1eeaea676b4472c39a4a33d631cabdae372'
$url64      = 'http://dlcf.reaper.fm/6.x/reaper604_x64-install.exe'
$checksum64 = 'b1a1fdabd45db6fd58b49cc40f1e456fd017c9d81d73c300ef0ed32c20cf421e'

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
