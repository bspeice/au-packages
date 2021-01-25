
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper621-install.exe'
$checksum32 = '3c271d75f0b2b942dc3464903c4108aafe5fba5ffa21798f2c34bf1beaf8bbd7'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper621_x64-install.exe'
$checksum64 = 'da08d7819766acd465fb2d319ec2fc1e50ade2adedd96e839b0620c05b0b095c'

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
