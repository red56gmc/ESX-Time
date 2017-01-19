
Get-VMHost | Sort-Object Name | Select Name, @{N="NTPServer";E={$_ | Get-VMHostNtpServer}}, @{N="ServiceRunning";E={(Get-VMHostService -VMHost $_ | Where-Object {$_.Key -eq "ntpd"}).Running}} | Format-Table -Autosize
