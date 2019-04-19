param([String]$server,[String]$Release,[String]$path_HotelHubAPI)
echo "Install API on $server release $Release to $path_HotelHubAPI"

Invoke-Command -ComputerName $server -FilePath ScriptsExpedia\LocalInstall_HotelHub.ps1 -ArgumentList $Release,$path_HotelHubAPI

