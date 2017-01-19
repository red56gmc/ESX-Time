#Requires -Modules VMware.VimAutomation.Core

#Connect to vCenter (uncomment if not currently connected)
#$vcenter = "vswcrpvmwvc01"
#Connect-VIServer -Server $vcenter

#Gets the current time on the system running the script and then the time for all ESXi Hosts.

$currenttime = Get-Date -Format g; Get-View -ViewType HostSystem -Property Name,ConfigManager.DateTimeSystem | sort Name | select Name,@{Name="Current VMHost Time";Expression={(Get-View $_.ConfigManager.DateTimeSystem).QueryDateTime()}}; Get-Date -Format g | Format-table -Autosize

Write-Host $currenttime
