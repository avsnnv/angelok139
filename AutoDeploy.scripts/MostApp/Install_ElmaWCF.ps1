param([String]$server,[String]$Release,[String]$path_WcfElma)
echo "Install ElmaWCF on $server release $Release to $path_WcfElma"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_ElmaWCF.ps1 -ArgumentList $Release,$path_WcfElma

