import-module Chocolatey-AU

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
  # First, find the Reaper version
  $download_page = Invoke-WebRequest -Uri "http://reaper.fm/download.php"

  $version_regex = ".*Version (.*): .*"
  $version_matchinfo = $download_page.Links | ? outerHTML -match $version_regex  | Select-Object -First 1 -expand outerHTML | Select-String -Pattern $version_regex
  $version_text = $version_matchinfo.Matches.Groups[1].Value

  $version_major = $version_text -split '\.' | Select-Object -First 1
  $version_minor = $version_text -split '\.' | Select-Object -First 1 -Skip 1
  $version_patch = $version_text -split '\.' | Select-Object -First 1 -Skip 2

  if ($null -eq $version_patch) {
    $version_patch = "0"
  }

  $version = "${version_major}.${version_minor}.${version_patch}"
  Write-Host "Found Reaper: text=${version_text} chocolatey=${version}"

  # Get the actual download URL
  $download_base = "https://reaper.fm/"

  $installer_32_regex = "reaper.*[^_64]-install.exe"
  $installer_32_exe = $download_page.Links | ? href -match $installer_32_regex | Select-Object -First 1 -expand href
  $installer_32_url = "${download_base}${installer_32_exe}"
  Write-Host "Found 32-bit installer: ${installer_32_url}"

  $installer_64_regex = "reaper.*_x64-install.exe"
  $installer_64_exe = $download_page.Links | ? href -match $installer_64_regex | Select-Object -First 1 -expand href
  $installer_64_url = "${download_base}${installer_64_exe}"
  Write-Host "Found 64-bit installer: ${installer_64_url}"

  return @{ URL64 = $installer_64_url; URL32 = $installer_32_url; Version = $version }
}

Update-Package
