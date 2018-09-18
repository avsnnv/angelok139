param([String]$server,[String]$Release,[String]$path_CBookingApi,$path_services,$path_HotelHub,$runHotelMapper)
echo "Install API on $server release $Release to $path_CBookingApi"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_CBookingAPI.ps1 -ArgumentList $Release,$path_CBookingApi,$path_services,$path_HotelHub,$runHotelMapper

