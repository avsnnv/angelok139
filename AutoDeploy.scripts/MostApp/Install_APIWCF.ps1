param([String]$server,[String]$Release,[String]$path_WcfAPI)
echo "Install ApiWCF on $server release $Release to $path_WcfAPI"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_APIWCF.ps1 -ArgumentList $Release,$path_WcfAPI

