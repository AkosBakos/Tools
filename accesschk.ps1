# Author: SmartCon GmbH, Ákos Bakos
# Date: 10.10.2023
# Purpose: Check folder permissions for AppLocker
# Template: 2.0

$HH = Get-Date -Format "HH"
$Time = Get-Date -Format "HHmmss"
$Date = Get-Date -Format "yyyyMMdd"

$LOGDIR = "$env:SYSTEMDRIVE\Logs"
$PACKAGENAME = "AccessChk_1.0"
$LOGFILE = Join-Path -Path $LOGDIR -ChildPath "$Date-$Time-$PACKAGENAME_I.log"

if (-not (Test-Path -Path $LOGDIR)) {
    New-Item -Path $LOGDIR -ItemType Directory
}

"$((Get-Date).ToString()) - Date and time is: $((Get-Date).ToString())" | Out-File -Append -FilePath $LOGFILE
"$((Get-Date).ToString()) - Current directory is: $PSScriptRoot" | Out-File -Append -FilePath $LOGFILE
"$((Get-Date).ToString()) - This PowerShell script is: $MyInvocation.MyCommand.Definition" | Out-File -Append -FilePath $LOGFILE

# Bitness Check
"$((Get-Date).ToString()) - Dump some vars (bitness check)" | Out-File -Append -FilePath $LOGFILE
"$((Get-Date).ToString()) - Variable ProgramFiles resolution: $env:ProgramFiles" | Out-File -Append -FilePath $LOGFILE
"$((Get-Date).ToString()) - Variable ProgramFiles(x86) resolution: $env:ProgramFiles(x86)" | Out-File -Append -FilePath $LOGFILE

# Package sections
$accesschk = Join-Path -Path $PSScriptRoot -ChildPath "accesschk.exe"

"$((Get-Date).ToString()) - Will try to accept EULA for $accesschk" | Out-File -Append -FilePath $LOGFILE
Start-Process -FilePath $accesschk -ArgumentList "-accepteula" -Wait

$foldersToCheck = @(
    "C:\Program Files",
    "C:\Program Files (x86)",
    "C:\Windows"
)

foreach ($folder in $foldersToCheck) {
    "$((Get-Date).ToString()) - Permissions for $env:USERNAME in $folder" | Out-File -Append -FilePath $LOGFILE
    "$((Get-Date).ToString()) - Execute `"$accesschk`" -w -s -q -u $env:USERNAME `"$folder`"" | Out-File -Append -FilePath $LOGFILE
    Start-Process -FilePath $accesschk -ArgumentList "-w", "-s", "-q", "-u", $env:USERNAME, $folder -Wait | Out-File -Append -FilePath $LOGFILE
}
