<<#
.SYNOPSIS
    Configures IPv6 source routing protection to the highest level (DisableIpSourceRouting = 2)
    as required by STIG ID: WN11-CC-000020.

.DESCRIPTION
    This script enforces the Windows 11 STIG requirement that disables IPv6 source routing
    to protect against packet spoofing and unauthorized routing manipulation.
    It sets the registry value:
        HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\DisableIpSourceRouting = 2

.NOTES
    Author          : Muhammad Asif
    LinkedIn        : N/A
    GitHub          : https://github.com/ddd381
    Date Created    : 2025-11-03
    Last Modified   : 2025-11-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000020

.TESTED ON
    Date(s) Tested  : 2025-11-03
    Tested By       : M. Daniyal Asif
    Systems Tested  : Windows 11
    PowerShell Ver. : 

.USAGE
    Run this script as Administrator.

    Example:
        PS C:\> .\WN11-CC-000020.ps1
#>

# IPv6 source routing must be configured to highest protection (STIG: WN11-CC-000020)

$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
$regName = "DisableIpSourceRouting"
$desiredValue = 2

try {
    # Ensure the registry path exists
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set the registry value to disable IPv6 source routing completely
    Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord -Force

    # Verify the change
    $current = (Get-ItemProperty -Path $regPath -Name $regName).$regName

    if ($current -eq $desiredValue) {
        Write-Host "✅ IPv6 source routing protection configured correctly (DisableIpSourceRouting = 2)" -ForegroundColor Green
    } else {
        Write-Host "⚠️ Failed to set DisableIpSourceRouting. Current value: $current" -ForegroundColor Yellow
    }
}
catch {
    Write-Host "❌ Error applying setting: $($_.Exception.Message)" -ForegroundColor Red
}
