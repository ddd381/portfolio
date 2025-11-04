<#
.SYNOPSIS
    Prevent users from changing Windows Installer installation options by setting EnableUserControl to 0.

.DESCRIPTION
    This script enforces the policy to disable user control over installation options by configuring
    the registry key 'EnableUserControl' to 0 under
    HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer. This aligns with STIG ID WN11-CC-000310.

.NOTES
    Author          : Muhammad Asif
    LinkedIn        : N/A
    GitHub          : https://github.com/ddd381
    Date Created    : 2025-11-03
    Last Modified   : 2025-11-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000310

.TESTED ON
    Date(s) Tested  : 20225-11-03
    Tested By       : M. Daniyal Asif
    Systems Tested  : Windows 11
    PowerShell Ver. :

.USAGE
    Run this script as Administrator.

    Example:
        PS C:\> .\WN11-CC-000310.ps1
#>

# Registry path and values
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$valueName = "EnableUserControl"
$valueData = 0

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value to disable user control over installs
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output confirmation
$setValue = Get-ItemProperty -Path $registryPath -Name $valueName
Write-Output "EnableUserControl is set to: $($setValue.EnableUserControl)"
