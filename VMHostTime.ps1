#Requires -Modules VMware.VimAutomation.Core

#Gets the current time on the system running the script and then the time for all ESXi Hosts.
$currenttime = Get-Date -Format g; Get-View -ViewType HostSystem -Property Name,ConfigManager.DateTimeSystem | sort Name | select Name,@{Name="Current VMHost Time";Expression={(Get-View $_.ConfigManager.DateTimeSystem).QueryDateTime()}}; Get-Date -Format g
Write-Host $currenttime
