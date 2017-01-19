#Requires -Modules VMware.VimAutomation.Core

#Connect to vCenter (uncomment if not currently connected)
#$vcenter = "vswcrpvmwvc01"
#Connect-VIServer -Server $vcenter

#Get the currently configure NTP settings for each VMHost
Get-VMHost | Sort-Object Name | Select Name, @{N="NTPServer";E={$_ | Get-VMHostNtpServer}}, @{N="ServiceRunning";E={(Get-VMHostService -VMHost $_ | Where-Object {$_.Key -eq "ntpd"}).Running}} | Format-Table -Autosize
