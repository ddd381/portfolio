<#
.SYNOPSIS
    Disables printing over HTTP by setting the registry value 'DisableHTTPPrinting' to 1 under HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers.

.NOTES
    Author          : Muhammad Asif
    LinkedIn        : N/A
    GitHub          : https://github.com/ddd381
    Date Created    : 2025-11-04
    Last Modified   : 2025-11-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110<#
.SYNOPSIS
    Disables printing over HTTP by setting the registry value 'DisableHTTPPrinting' to 1 under HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers.

.NOTES
    Author          : Muhammad Asif
    LinkedIn        : N/A
    GitHub          : https://github.com/ddd381
    Date Created    : 2025-11-04
    Last Modified   : 2025-11-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110

.TESTED ON
    Date(s) Tested  : 2025-11-04
    Tested By       : M. Daniyal Asif
    Systems Tested  : Windows 11
    PowerShell Ver. : 10.0

.USAGE
    Example syntax:
    PS C:\> .\WN11-CC-000110.ps1
#>

# Run as Administrator

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$valueName = "DisableHTTPPrinting"
$valueData = 1

# Create registry path if it doesn’t exist
If (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set DisableHTTPPrinting to 1
New-ItemProperty -Path $regPath -Name $valueName -PropertyType DWord -Value $valueData -Force | Out-Null

# Verify
$verify = Get-ItemProperty -Path $regPath -Name $valueName
If ($verify.$valueName -eq 1) {
    Write-Host "Printing over HTTP has been disabled successfully." -ForegroundColor Green
} Else {
    Write-Host "Failed to disable printing over HTTP." -ForegroundColor Red
}


.TESTED ON
    Date(s) Tested  : 2025-11-04
    Tested By       : M. Daniyal Asif
    Systems Tested  : Windows 11
    PowerShell Ver. : 10.0

.USAGE
    Example syntax:
    PS C:\> .\WN11-CC-000110.ps1
#>

# Run as Administrator

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$valueName = "DisableHTTPPrinting"
$valueData = 1

# Create registry path if it doesn’t exist
If (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set DisableHTTPPrinting to 1
New-ItemProperty -Path $regPath -Name $valueName -PropertyType DWord -Value $valueData -Force | Out-Null

# Verify
$verify = Get-ItemProperty -Path $regPath -Name $valueName
If ($verify.$valueName -eq 1) {
    Write-Host "Printing over HTTP has been disabled successfully." -ForegroundColor Green
} Else {
    Write-Host "Failed to disable printing over HTTP." -ForegroundColor Red
}
