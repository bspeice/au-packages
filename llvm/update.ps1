import-module au

$releases = 'https://releases.llvm.org/'

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

    $re = "download.html\#[0-9].*"
    $dl = $download_page.links | ? href -match $re | select -First 1 -expand href
    $version = $dl -split '#' | select -Last 1

    $url32 = 'https://releases.llvm.org/' + $version + '/LLVM-' + $version + '-win32.exe'
    $url64 = 'https://releases.llvm.org/' + $version + '/LLVM-' + $version + '-win64.exe'

    $version = "$version"

    Write-Host $version
    Write-Host $url32
    Write-Host $url64

    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update
