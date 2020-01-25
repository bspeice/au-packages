import-module au

$releases = 'https://capnproto.org/install.html'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "capnproto-c\+\+-win32-.*.zip"
    $installer_exe = $download_page.Links | ? href -match $re | select -First 1 -expand href
    # Write-Host $installer_exe
    if ($installer_exe) {
      $version = $installer_exe -split '-|\.zip' | select -First 1 -Skip 3
    }
    # Write-Host $version

    if ($version) {
      $url32 = 'https://capnproto.org/capnproto-c++-win32-' + $version + '.zip'
    }

    # Write-Host $version
    # Write-Host $url32

    return @{ URL32 = $url32; Version = $version }
}

Update-Package
