import-module au

$releases = 'http://reaper.fm/download.php'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "reaper.*-install.exe"
    $installer = $download_page.links | ? href -match $re | Select-Object -First 1 -expand href
    $version_compact = $installer -split 'reaper|-' | Select-Object -Last 1 -Skip 1
    Write-Host $version_compact
    $version_major = '6'
    $version_minor = $version_compact -split $version_major,2 -join '.'

    $version = $version_major + $version_minor

    $url32 = 'http://dlcf.reaper.fm/' + $version_major + '.x/reaper' + $version_compact + '-install.exe'
    $url64 = 'http://dlcf.reaper.fm/' + $version_major + '.x/reaper' + $version_compact + '_x64-install.exe'

    Write-Host $version
    Write-Host $url32
    Write-Host $url64

    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

Update-Package
