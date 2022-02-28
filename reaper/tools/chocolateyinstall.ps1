
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://dlcf.reaper.fm/6.x/reaper649-install.exe'
$checksum32 = 'b915414df395263b5d6f3f3dacb06ea3658b9b0877118725a43fd570190823a6'
$url64 = 'https://dlcf.reaper.fm/6.x/reaper649_x64-install.exe'
$checksum64 = '7bb254c5558f7c5b28a3cd8b886b665147ed71d076bc0c5497dd3489b145cf5a'

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
