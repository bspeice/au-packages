import-module au

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $latest_release_endpoint = 'https://api.github.com/repos/fabiospampinato/notable/releases/latest'
    $latest_release = Invoke-RestMethod $latest_release_endpoint
    $name = $latest_release.name
    $version = $name -split 'v' | Select-Object -Last 1

    $url32 = 'https://github.com/fabiospampinato/notable/releases/download/v' + $version + '/Notable.Setup.' + $version + '.exe'

    Write-Host $version
    Write-Host $url32

    return @{ URL32 = $url32; Version = $version }
}

Update-Package
