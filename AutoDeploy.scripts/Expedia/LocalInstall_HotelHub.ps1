param([String]$Release,[String]$path_HotelHubAPI)

cd c:\temp

mkdir $path_ExpediaAPI
robocopy CBooking.MetaHotelHub.API $path_ExpediaAPI /E 

