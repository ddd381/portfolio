<#
.SYNOPSIS
    Disables Microsoft Consumer Experiences as per STIG ID: WN11-CC-000197.

.DESCRIPTION
    This script enforces the STIG requirement to turn off Microsoft consumer experiences by
    creating or updating the registry key that controls Windows consumer features.

.NOTES
    Author          : Muhammad Asif
     GitHub         : https://github.com/ddd381
    Date Created    : 2024-09-09
    Last Modified   : 2025-11-03
    Version         : 1.1
    STIG ID         : WN11-CC-000197
    SRG             : SRG-OS-000095-GPOS-00049
    CCI             : CCI-000381
    Severity        : Low
    VulnerabilityID : V-253390
#>

# Ensure script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script as Administrator." -ForegroundColor Red
    exit
}

# Define registry path and key
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$valueName = "DisableWindowsConsumerFeatures"
$desiredValue = 1

# Create the registry path if it does not exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    Write-Host "Created registry path: $registryPath"
}

# Set or update the registry value
$currentValue = (Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue).$valueName
if ($currentValue -ne $desiredValue) {
    New-ItemProperty -Path $registryPath -Name $valueName -Value $desiredValue -PropertyType DWord -Force | Out-Null
    Write-Host "Microsoft Consumer Experiences have been turned OFF (STIG applied)." -ForegroundColor Green
} else {
    Write-Host "Microsoft Consumer Experiences are already disabled. No change required." -ForegroundColor Yellow
}

# Verify the result
Write-Host "`nVerification:"
Get-ItemProperty -Path $registryPath | Select-Object $valueName
