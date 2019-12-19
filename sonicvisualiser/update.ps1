import-module au

$releases = 'https://www.sonicvisualiser.org/download.html'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex   = '.*-win32.msi$'
    $url     = $download_page.links | ? href -match $regex | Select-Object -Skip 1 -expand href
    $regex64 = '.*-win64.msi$'
    $url64   = $download_page.links | ? href -match $regex64 | Select-Object -Skip 1 -expand href
    $version = $url64 -split '-|.msi' | Select-Object -Last 1 -Skip 2
    # Write-Host $url64
    # Write-Host $url
    # Write-Host $version
    return @{ Version = $version; URL32 = $url; URL64 = $url64 }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

Update-Package