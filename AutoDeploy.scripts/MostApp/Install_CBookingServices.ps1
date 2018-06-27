param([String]$server,[String]$Release)
echo "Install Services on $server release $Release to $path_CBookingApi"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_CBookingServices.ps1 -ArgumentList $Release

