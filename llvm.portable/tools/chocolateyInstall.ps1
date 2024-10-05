$ErrorActionPreference = 'Stop'

$packageName = 'llvm.portable'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

# Decompresses .tar.xz into .tar archive
$packageArgs = @{
  PackageName    = $packageName
  FileFullPath64 = Get-Item $toolsPath\*-X64.tar.xz
  Destination    = $toolsPath
}
Get-ChocolateyUnzip @packageArgs

if (Test-Path "$toolsPath\LLVM*.tar") {
  # Untars the archive into the folders we care about
  $packageArgs = @{
    PackageName    = $packageName
    FileFullPath64 = Get-Item $toolsPath\*-X64.tar
    Destination    = $toolsPath
  }
  Get-ChocolateyUnzip @packageArgs
  Remove-Item "$toolsPath\LLVM*.tar"
}
