
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper777-install.exe'
$checksum32 = '2a1f181323833ed1bc261264b9e6a7947a0b58807ce004836f32f0157ba30c5b'
$url64 = 'https://reaper.fm/files/7.x/reaper777_x64-install.exe'
$checksum64 = 'e94f7d831ac8748651619dc5982418bb28b3de60033075081e115df452010caa'

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
