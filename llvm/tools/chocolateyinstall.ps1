
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-23.1.3/LLVM-23.1.3-win64.msi'
$checksum64 = '5153f848ac87553118340f16f8d3cd4351d729bcba6e4785c6a4a9af29676de9'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = $url64

  softwareName   = 'llvm*'

  checksum64     = $checksum64
  checksumType64 = 'sha256'


  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 1641, 3010)
}


Install-ChocolateyPackage @packageArgs

# Check if Visual Studio is installed
# While there have been some reports of this not working well for some users, it is a method recommended by MSFT:
# https://docs.microsoft.com/en-us/visualstudio/install/tools-for-managing-visual-studio-instances?view=vs-2019#using-windows-management-instrumentation-wmi
# I'm open to other suggestions for detection, but can confirm that this works for both regular and admin shells for me.
try {
  (Get-CimInstance MSFT_VSInstance -Namespace root/cimv2/vs) | out-null
}
catch {
  Write-Host "NOTE: Visual Studio not detected. LLVM does not provide a C/C++ standard library and may be unable to locate MSVC headers."
}

Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "Machine" # Machine will assert administrative rights
Install-ChocolateyPath "$($env:SystemDrive)\Program Files (x86)\LLVM\bin" "Machine" # Machine will assert administrative rights
