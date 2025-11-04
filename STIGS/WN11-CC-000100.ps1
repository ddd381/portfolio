<#
.SYNOPSIS
    This script disables downloading of print driver packages over HTTP 
    by configuring the registry setting as per STIG ID: WN11-CC-000100.

.DESCRIPTION
    Some Windows features may communicate externally to download drivers or components.
    This script enforces the policy that prevents the computer from downloading print 
    driver packages over HTTP, enhancing system security.

.NOTES
    Author          : Muhammad Asif
    LinkedIn        : N/A
    GitHub          : https://github.com/ddd381
    Date Created    : 2025-11-03
    Last Modified   : 2025-11-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000100

.TESTED ON
    Date(s) Tested  : 2025-11-03
    Tested By       : M. Daniyal Asif
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1, 7.4

.USAGE
    Run this script as Administrator.

    Example:
        PS C:\> .\WN11-CC-000100.ps1
#>

Write-Host "Applying STIG WN11-CC-000100: Disable WebPnP print driver download..." -ForegroundColor Cyan

# Registry details
$regPath   = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$valueName = "DisableWebPnPDownload"
$valueData = 1

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

# Verify configuration
$current = (Get-ItemProperty -Path $regPath -Name $valueName).$valueName

if ($current -eq $valueData) {
    Write-Host "Success: Print driver downloads over HTTP are disabled." -ForegroundColor Green
} else {
    Write-Host "Error: Failed to apply the setting." -ForegroundColor Red
}
