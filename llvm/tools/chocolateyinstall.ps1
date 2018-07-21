
$ErrorActionPreference = 'Stop';

$packageName= 'llvm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://releases.llvm.org/6.0.1/LLVM-6.0.1-win32.exe'
$checksum32 = '534dbe5931f48979e793ef4ab245eb47fbc9c40e6a5b9f25fbc599c787834d35'
$url64      = 'https://releases.llvm.org/6.0.1/LLVM-6.0.1-win64.exe'
$checksum64 = '780276221635aa08120187ffc2c72ff7873dee37f5609455ee7bba6fcdd91d79'

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
