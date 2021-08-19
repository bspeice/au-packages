import-module au

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
    $latest_release_endpoint = 'https://api.github.com/repos/llvm/llvm-project/releases/latest'
    $latest_release = Invoke-RestMethod $latest_release_endpoint -UseBasicParsing
    $name = $latest_release.name
    $version = $name -split 'LLVM ' | Select-Object -Last 1

    $url32 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-' + $version + '/LLVM-' + $version + '-win32.exe'
    $url64 = 'https://github.com/llvm/llvm-project/releases/download/llvmorg-' + $version + '/LLVM-' + $version + '-win64.exe'

    Write-Host $version
    Write-Host $url32
    Write-Host $url64

    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

#Update-Package -NoCheckChocoVersion
Update-Package
