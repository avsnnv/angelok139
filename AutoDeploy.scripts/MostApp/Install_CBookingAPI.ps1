param([String]$server,[String]$Release,[String]$path_path_CBookingApi)
echo "Install API on $server release $Release to $path_path_CBookingApi"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_CBookingAPI.ps1 -ArgumentList $Release,$path_CBookingApi

