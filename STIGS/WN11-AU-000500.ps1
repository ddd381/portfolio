<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Muhammad Asif
    LinkedIn        : linkedin.com/in/joshmadakor/
    GitHub          : https://github.com/ddd381
    Date Created    : 2025-11-02
    Last Modified   : 2025-11-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-AU-000500).ps1 
#>

# Set the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize value to 0x00008000 (32768 decimal)
Set-ItemProperty -Path $regPath -Name "MaxSize" -Value 32768 -Type DWord

# Verify the change
Get-ItemProperty -Path $regPath | Select-Object MaxSize
