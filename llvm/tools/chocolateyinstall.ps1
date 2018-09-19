
$ErrorActionPreference = 'Stop';

$packageName= 'llvm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://releases.llvm.org/7.0.0/LLVM-7.0.0-win32.exe'
$checksum32 = 'c3aa07231ab84f7ab4bb47b3cda4393c8203f3254a04b602cdfdc116c4c058f5'
$url64      = 'https://releases.llvm.org/7.0.0/LLVM-7.0.0-win64.exe'
$checksum64 = '74b197a3959b0408adf0824be01db8dddfa2f9a967f4085af3fad900ed5fdbf6'

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
