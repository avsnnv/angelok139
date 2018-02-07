param([String]$server,[String]$Release,[String]$path_MetaApi)
echo "Install MetaAPI on $server release $Release to $path_MetaApi"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_MetaApi.ps1 -ArgumentList $Release,$path_MetaApi

