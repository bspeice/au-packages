import-module au

$releases = 'https://sourceforge.net/projects/impro-visor/files/'

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex = 'Impro-Visor%20.*%20Release'
    $version = ($download_page.Links | ? href -match $regex | Select-Object -First 1 -expand href) -split '%20' | Select-Object -Skip 1 -First 1
    $version_underscore = $version.replace('.', '_')
    $url = 'https://sourceforge.net/projects/impro-visor/files/Impro-Visor%20' + $version + '%20Release/Impro-Visor_windows_' + $version_underscore + '.exe/download'
    $url64 = 'https://sourceforge.net/projects/impro-visor/files/Impro-Visor%20' + $version + '%20Release/Impro-Visor_windows-x64_' + $version_underscore + '.exe/download'
    return @{ Version = $version; URL32 = $url; URL64 = $url64 }
}

Update-Package