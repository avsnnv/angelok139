param([String]$Release,[String]$path_HotelHubAPI)

cd c:\temp

mkdir $path_HotelHubAPI
robocopy CBooking.MetaHotelHub.API $path_HotelHubAPI /E 

