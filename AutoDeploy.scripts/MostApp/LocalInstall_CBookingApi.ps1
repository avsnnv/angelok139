param([String]$Release,[String]$path_CBookingApi)

mkdir $path_CBookingApi

Move-Item c:\temp\Most.Core.CBooking.API\* $path_CBookingApi\

