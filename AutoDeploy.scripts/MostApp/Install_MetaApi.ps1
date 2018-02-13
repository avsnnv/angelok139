param([String]$server,[String]$Release,[String]$path_MetaApi,[String]$path_MetaWCF)
echo "Install MetaAPI on $server release $Release to $path_MetaApi and $path_MetaWCF"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_MetaApi.ps1 -ArgumentList $Release,$path_MetaApi,$path_MetaWCF

