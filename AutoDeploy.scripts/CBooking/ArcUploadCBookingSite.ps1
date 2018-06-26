param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename CbookingWebsite
Move-Item hdsorderfo hdsorderfo2
Move-Item hdsorderfo_old hdsorderfo
& "C:\Program Files\7-Zip\7z.exe" a $Filename hdswebsite 
& "C:\Program Files\7-Zip\7z.exe" a $Filename hdscontent
& "C:\Program Files\7-Zip\7z.exe" a $Filename hdssvc
& "C:\Program Files\7-Zip\7z.exe" a $Filename hdsbo
& "C:\Program Files\7-Zip\7z.exe" a $Filename hdsgateway
& "C:\Program Files\7-Zip\7z.exe" a $Filename buhdocs
& "C:\Program Files\7-Zip\7z.exe" a $Filename hdsorderfo
& "C:\Program Files\7-Zip\7z.exe" a $Filename hdsorderfo2
& "C:\Program Files\7-Zip\7z.exe" a $Filename channelmanagerapi
& "C:\Program Files\7-Zip\7z.exe" a $Filename hotelgateway
& "C:\Program Files\7-Zip\7z.exe" a $Filename cmxmlapi
& "C:\Program Files\7-Zip\7z.exe" a $Filename download
& "C:\Program Files\7-Zip\7z.exe" a $Filename Style
& "C:\Program Files\7-Zip\7z.exe" a $Filename Backoffice
& "C:\Program Files\7-Zip\7z.exe" a $Filename DBExporterConsole
& "C:\Program Files\7-Zip\7z.exe" a $Filename VBRunningServiceSQL
& "C:\Program Files\7-Zip\7z.exe" a $Filename MailsheduleChecker

copy $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\CBooking.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\CBooking.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

