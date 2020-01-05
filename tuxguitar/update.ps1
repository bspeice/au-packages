import-module au

$releases = 'https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/'

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex = 'TuxGuitar-.*'
    $version = (($download_page.Links | ? href -match $regex | Select-Object -First 1 -expand href) -split '-' | Select-Object -Skip 1).Trim('/')
    $url = 'https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/TuxGuitar-' + $version + '/tuxguitar-' + $version + '-windows-x86-installer.exe/download'
    return @{ Version = $version; URL32 = $url }
}

Update-Package
