import-module au

function global:au_SearchReplace {
  @{
    "tools\chocolateyInstall.ps1" = @{
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {
  $latest_release_endpoint = 'https://api.github.com/repos/helge17/tuxguitar/releases/latest'
  $latest_release = Invoke-RestMethod $latest_release_endpoint -UseBasicParsing
  $name = $latest_release.name
  $version = $name -split ' ' | Select-Object -Last 1

  $url64 = 'https://github.com/helge17/tuxguitar/releases/download/' + $version + '/tuxguitar-' + $version + '-windows-swt-x86_64-installer.exe'

  Write-Host $version
  Write-Host $url64

  return @{ Version = $version; URL64 = $url64 }
}

Update-Package -ChecksumFor 64
