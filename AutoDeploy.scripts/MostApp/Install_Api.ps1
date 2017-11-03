param([String]$server,[String]$Release,[String]$path_api)
echo "Install API on $server release $Release to $path_api"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_Api.ps1 -ArgumentList $Release $path_api

