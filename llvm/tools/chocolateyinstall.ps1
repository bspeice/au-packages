
$ErrorActionPreference = 'Stop';

$packageName= 'llvm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://releases.llvm.org/7.0.1/LLVM-7.0.1-win32.exe'
$checksum32 = 'd56d8716da871c1895646b47aa406b27045d7155efdb4c5425dbe28b41df90b3'
$url64      = 'https://releases.llvm.org/7.0.1/LLVM-7.0.1-win64.exe'
$checksum64 = '672e4c420d6543a8a9f8ec5f1e5f283d88ac2155ef4c57232a399160a02bff57'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'llvm*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'


  silentArgs   = '/S'
  validExitCodes= @(0)
}


Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "Machine" # Machine will assert administrative rights
