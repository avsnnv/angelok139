param([String]$server,[String]$Release,[String]$path_TaxiApi,[String]$path_Services)
echo "Install TaxiAPI on $server release $Release to $path_TaxiApi and $Path_Services"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_Taxi.ps1 -ArgumentList $path_TaxiApi,$path_Services

