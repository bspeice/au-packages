
$ErrorActionPreference = 'Stop';

$packageName= 'llvm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://releases.llvm.org/6.0.0/LLVM-6.0.0-win32.exe'
$checksum32 = '7e3142d623ff12e18bea598e1bd55d8c96ff660f735daf0a469c2033b4d13c2c'
$url64      = 'https://releases.llvm.org/6.0.0/LLVM-6.0.0-win64.exe'
$checksum64 = '2501887b2f638d3f65b0336f354b96f8108b563522d81e841d5c88c34af283dd'

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


# Thanks to https://github.com/kendaleiv/chocolatey-veracrypt
# and https://github.com/improbable-io/clang-choco/pull/8
# for helping with the AutoHotKey automation.
# This is needed for users without MSVC installed,
# LLVM pops open a window saying that MSVC isn't detected.
$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "llvmInstall.ahk"
$ahkProc = Start-Process -FilePath $ahkExe `
                         -ArgumentList $ahkFile `
                         -PassThru
 
$ahkId = $ahkProc.Id
Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$ahkId"

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "Machine" # Machine will assert administrative rights
