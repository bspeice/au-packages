
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dlcf.reaper.fm/6.x/reaper629-install.exe'
$checksum32 = 'f4dbb222663d30a8753397ff0ca6a813f1c3af4e41c3843b92213ee26ed60023'
$url64      = 'https://dlcf.reaper.fm/6.x/reaper629_x64-install.exe'
$checksum64 = '1042190df292b86860ecd24210d60b4ef678598c1f0860c6ebab115da99bc128'

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
