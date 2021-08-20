import-module au

$releases = 'https://www.sonicvisualiser.org/download.html'

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = '.*-win32.msi$'
  $url = $download_page.Links | ? href -match $regex | Select-Object -First 1 -expand href
  $regex64 = '.*-win64.msi$'
  $url64 = $download_page.Links | ? href -match $regex64 | Select-Object -First 1 -expand href
  $version = $url64 -split '-|.msi' | Select-Object -Last 1 -Skip 2
  # Write-Host $url
  # Write-Host $url64
  # Write-Host $version
  return @{ Version = $version; URL32 = $url; URL64 = $url64 }
}

function global:au_SearchReplace {
  @{
    "tools\chocolateyInstall.ps1" = @{
      "(^[$]url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
      "(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

Update-Package
