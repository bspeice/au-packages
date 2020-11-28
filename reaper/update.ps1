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
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $regex = "reaper.*-install.exe"
  $installer_exe = $download_page.Links | ? href -match $regex | Select-Object -First 1 -expand href
  if ($installer_exe) {
    $version_compact = $installer_exe -split 'reaper|_' | Select-Object -Last 1 -Skip 1
  }
  # Write-Host $version_compact
  if ($installer_exe) {
    $version_major = $installer_exe -split '/|\.' | Select-Object -First 1 -Skip 1
  }
  if ($version_compact -And $version_major) {
    $version_minor = $version_compact -split $version_major, 2 -join ''
  }

  if ($version_major -And $version_minor) {
    $version = $version_major + '.' + $version_minor
    $version = Get-Version $version
  }

  if ($version_compact -And $version_major) {
    $url32 = 'https://dlcf.reaper.fm/' + $version_major + '.x/reaper' + $version_compact + '-install.exe'
    $url64 = 'https://dlcf.reaper.fm/' + $version_major + '.x/reaper' + $version_compact + '_x64-install.exe'
  }

  # Write-Host $version
  # Write-Host $url32
  # Write-Host $url64

  return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

Update-Package
