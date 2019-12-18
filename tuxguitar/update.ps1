import-module au

$releases = 'https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/'

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"     
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex   = 'tuxguitar-.*-windows-x86-installer.exe'
    $url     = $download_page.links | ? href -match $regex | Select-Object -First 1 -expand href
    $version = $url -split '-|.exe' | Select-Object -Last 1 -Skip 2
    return @{ Version = $version; URL32 = $url }
}

Update-Package