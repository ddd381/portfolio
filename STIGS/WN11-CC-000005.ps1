<#
.SYNOPSIS
    Disables camera access from the lock screen as required by STIG ID: WN11-CC-000005.

.NOTES
    Author          : Muhammad Asif
    LinkedIn        : N/A
    GitHub          : https://github.com/ddd381
    Date Created    : 2025-11-04
    Last Modified   : 2025-11-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000005

.TESTED ON
    Date(s) Tested  : 2025-11-04
    Tested By       : M. Daniyal Asif
    Systems Tested  : Windows 11
    PowerShell Ver. : 10.0

.USAGE
    Run this script as Administrator.

    Example:
        .\Disable-LockScreenCamera.ps1
#>

# Define registry path and value
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$ValueName = "NoLockScreenCamera"
$DesiredValue = 1

# Ensure the registry path exists
    if (-not (Test-Path $RegPath)) {
        New-Item -Path $RegPath -Force | Out-Null
    }
# Set the registry value to disable camera on lock screen
    Set-ItemProperty -Path $RegPath -Name $ValueName -Value $DesiredValue -Type DWord

# Verify and display result
    $CurrentValue = (Get-ItemProperty -Path $RegPath -Name $ValueName).$ValueName
    if ($CurrentValue -eq $DesiredValue) {
        Write-Host "[✔] Camera access from the lock screen has been successfully disabled." -ForegroundColor Green
    } else {
        Write-Host "[✖] Failed to configure the setting." -ForegroundColor Red
    }


