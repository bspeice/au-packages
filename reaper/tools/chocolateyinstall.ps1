
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper776-install.exe'
$checksum32 = 'c8ce0d7c8683cacb90317f9ebea11aaceb332419580456042355f917e10444cf'
$url64 = 'https://reaper.fm/files/7.x/reaper776_x64-install.exe'
$checksum64 = '86f7421c710b2ea294e3fedd3b22a652c07e32fb288be8a2db75e6239710c4d1'

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
