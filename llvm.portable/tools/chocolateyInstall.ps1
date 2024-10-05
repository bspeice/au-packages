$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$url64 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.0/LLVM-19.1.0-Windows-X64.tar.xz'
$checksum64 = ''

$packageArgs = @{
  PackageName    = $packageName
  FileFullPath64 = Get-Item $toolsPath\*-Windows-X64.tar.xz
  Destination    = "$(Get-ToolsLocation)\llvm"

  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}
Get-ChocolateyUnzip @packageArgs
Install-ChocolateyPath "$($packageArgs.Destination)\bin"

Get-ChildItem $toolsPath\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" '' } }
