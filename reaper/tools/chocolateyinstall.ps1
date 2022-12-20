
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper672-install.exe'
$checksum32 = '2a38c0296f5521df3c6fd0c35063aa3244b9dbc6aaac05655fea06ad3820bc42'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper672_x64-install.exe'
$checksum64 = '464a322920b78d2bdf00ffe2cf4ffe82ffc760e1d38c30efce5ee84b082d2de7'

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
