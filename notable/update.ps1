import-module au

$releases = 'https://api.github.com/repos/fabiospampinato/notable/releases'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $all_releases = Invoke-RestMethod $releases
    $tag = $all_releases[0].name
    $version = $tag -split 'v' | select -Last 1

    $url32 = 'https://github.com/fabiospampinato/notable/releases/download/v' + $version + '/Notable.Setup.' + $version + '.exe'

    Write-Host $version
    Write-Host $url32

    return @{ URL32 = $url32; Version = $version }
}

Update-Package
