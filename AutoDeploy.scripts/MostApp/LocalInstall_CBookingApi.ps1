﻿param([String]$Release,[String]$path_CBookingApi,$path_services,$path_HotelHub)
remove-item $path_CBookingApi -recurse -force
mkdir $path_CBookingApi

Move-Item c:\temp\Most.Core.CBooking.API\* $path_CBookingApi\

remove-item $path_HotelHub -recurse -force
mkdir $path_HotelHub

Move-Item c:\temp\Most.Core.HotelHub.WCF\* $path_HotelHub\

remove-item $path_services\CbookingSettingsService -recurse -force
mkdir $path_services\CbookingSettingsService
Move-Item c:\temp\Most.Core.SettingsService\* $path_services\CbookingSettingsService\

remove-item $path_services\HotelBookGateway.WCF
mkdir $path_services\HotelBookGateway.WCF
Move-Item c:\temp\Most.Core.HotelBook.Gateway.WCF\* $path_services\HotelBookGateway.WCF