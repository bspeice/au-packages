$ErrorActionPreference = 'Stop'

$packageName = 'llvm.portable'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$url64 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.3/LLVM-19.1.3-Windows-X64.tar.xz'
$checksum64 = '1077267ca353a1e236055ed4b57d6a404d09c40b01bd27dc882870395cdc1aae'

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

# Validator takes too long to install shims, so disable all generation
# and add to PATH instead
Get-ChildItem "$toolsPath\bin" -Filter *.exe | Foreach-Object {
  $exeName = $_.FullName
  echo $null >> "$exeName.ignore"
}
Install-ChocolateyPath "$toolsPath\bin" "User"