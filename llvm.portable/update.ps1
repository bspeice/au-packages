import-module Chocolatey-AU

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{}
}

function global:au_GetLatest {
  $latest_release_endpoint = 'https://api.github.com/repos/llvm/llvm-project/releases/latest'
  $latest_release = Invoke-RestMethod $latest_release_endpoint -UseBasicParsing
  $name = $latest_release.name
  $version = $name -split 'LLVM ' | Select-Object -Last 1

  $url64 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-' + $version + '/LLVM-' + $version + '-Windows-X64.tar.xz'

  Write-Host $version
  Write-Host $url64

  return @{ URL64 = $url64; Version = $version }
}

#Update-Package -NoCheckChocoVersion
Update-Package -ChecksumFor none