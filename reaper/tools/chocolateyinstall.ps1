
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper746-install.exe'
$checksum32 = '4b2da5d140f8b482529617ed34f4b9659762142a478b5493c903b1023d628e5f'
$url64 = 'https://reaper.fm/files/7.x/reaper746_x64-install.exe'
$checksum64 = '40bb6060a9d50648145cba30a13280c13a1243961e29d1f39e2e03172847edf0'

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
