import-module au

$releases = 'https://www.sonicvisualiser.org/download.html'

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex64 = '.*-win64.msi$'
  $url64 = $download_page.Links | ? href -match $regex64 | Select-Object -First 1 -expand href
  $version = $url64 -split '-|.msi' | Select-Object -Last 1 -Skip 2
  # Write-Host $url64
  # Write-Host $version
  return @{ Version = $version; URL64 = $url64 }
}

function global:au_SearchReplace {
  @{
    "tools\chocolateyInstall.ps1" = @{
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

Update-Package -ChecksumFor 64
