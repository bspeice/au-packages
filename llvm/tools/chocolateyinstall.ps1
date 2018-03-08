
$ErrorActionPreference = 'Stop';

$packageName= 'llvm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://releases.llvm.org/5.0.1/LLVM-5.0.1-win32.exe'
$checksum32 = '5de70ab482edb2da7ac20126dc58e23a691498aa644ca23a7b10c32c9ee62157'
$url64      = 'https://releases.llvm.org/5.0.1/LLVM-5.0.1-win64.exe'
$checksum64 = '981543611d719624acb29a2cffd6a479cff36e8ab5ee8a57d8eca4f9c4c6956f'

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
