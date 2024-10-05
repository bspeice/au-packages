$ErrorActionPreference = 'Stop'

$packageName = 'llvm.portable'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$url64 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.0/LLVM-19.1.0-Windows-X64.tar.xz'
$checksum64 = 'a132377865d72bc7452343d59d05da63266ffc928b4072d63fb854fd42097dc4'

# Fetch and decompresses .tar.xz into .tar archive
$packageArgs = @{
  PackageName    = $packageName
  Url64Bit       = $url64
  Checksum64     = $checksum64
  ChecksumType64 = 'sha256'
  UnzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

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
