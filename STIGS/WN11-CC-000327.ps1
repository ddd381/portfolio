<#
.SYNOPSIS
    Enables PowerShell Transcription as required by STIG ID: WN11-CC-000327.

.NOTES
    Author          : Muhammad Asif
    LinkedIn        : N/A
    GitHub          : https://github.com/ddd381
    Date Created    : 2025-11-03
    Last Modified   : 2025-11-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000327

.TESTED ON
    Date(s) Tested  : 2025-11-03
    Tested By       : M. Daniyal Asif
    Systems Tested  : Windows 11
    PowerShell Ver. : 10.0

.USAGE
    Run this script as Administrator.

    Example:
        PS C:\> .\WN11-CC-000327.ps1
#>

Write-Host "Applying STIG WN11-CC-000327: Enabling PowerShell Transcription..." -ForegroundColor Cyan

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"
$outputDir = "C:\Transcripts"

# Create output directory if it doesn't existif (-not (Test-Path $outputDir)) {
    New-Item -Path $outputDir -ItemType Directory -Force | Out-Null
}

# Create registry path if needed
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Enable PowerShell Transcription
New-ItemProperty -Path $regPath -Name "EnableTranscripting" -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $regPath -Name "OutputDirectory" -Value $outputDir -PropertyType String -Force | Out-Null

Write-Host "Success: PowerShell Transcription enabled." -ForegroundColor Green
Write-Host "Logs will be saved in: $outputDir" -ForegroundColor Yellow
