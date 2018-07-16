param([String]$server,[String]$Release,[String]$path_Orange, $path_services)
echo "Install OrangeService on $server release $Release to $path_Orange and $path_services"

Invoke-Command -ComputerName $server -FilePath DevOps/LocalInstall_OrangeService.ps1 -ArgumentList $Release,$path_Orange,$path_services

