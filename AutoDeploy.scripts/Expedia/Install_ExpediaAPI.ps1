param([String]$server,[String]$Release,[String]$path_ExpediaAPI)
echo "Install API on $server release $Release to $path_ExpediaAPI"

Invoke-Command -ComputerName $server -FilePath LocalInstall_ExpediaAPI.ps1 -ArgumentList $Release,$path_ExpediaAPI

