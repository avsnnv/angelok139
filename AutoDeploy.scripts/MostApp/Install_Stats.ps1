param([String]$server,[String]$Release,[String]$path_stats)
echo "Install API on $server release $Release to $path_stats"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_Stats.ps1 -ArgumentList $Release,$path_stats

