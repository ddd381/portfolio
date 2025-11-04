<#
.SYNOPSIS
    Enables the use of a hardware security device (TPM) for Windows Hello for Business
    in compliance with STIG ID: WN11-CC-000255.

.NOTES
    Author          : Muhammad Asif
    LinkedIn        : N/A
    GitHub          : https://github.com/ddd381
    Date Created    : 2025-11-04
    Last Modified   : 2025-11-04
    Version         : 1.0
    STIG-ID         : WN11-CC-000255
#>

# STIG ID: WN11-CC-000255 - Enable use of hardware security device (TPM) for Windows Hello for Business

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork"
$Name = "RequireSecurityDevice"
$Value = 1

# Create registry path if missing
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set registry value
New-ItemProperty -Path $RegPath -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null
Write-Output "Hardware security device requirement enabled for Windows Hello for Business."
