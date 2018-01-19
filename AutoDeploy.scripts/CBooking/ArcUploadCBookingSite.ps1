﻿param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename CbookingWebsite
Move-Item hdsorderfo hdsorderfo2
Move-Item hdsorderfo_old hdsorderfo
& "C:\Program Files\7-Zip\7z.exe" a $Filename hdswebsite hdscontent hdssvc hdsbo hdsgateway buhdocs hdsorderfo hdsorderfo2 channelmanagerapi hotelgateway cmxmlapi download Style Backoffice DBExporterConsole VBRunningServiceSQL MailsheduleChecker

copy $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\CBooking.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\CBooking.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename
