param($Filename,[String]$Release)

echo "Prepare and Archive Distributive CbookingAPI for $Release enviropment to $Filename"

Remove-Item -force Most.Core.CBooking.API\Web.config
Copy-Item Most.Core.CBooking.API\Web.$Release.config Most.Core.CBooking.API\Web.config

Remove-Item -force Most.Core.CBooking.WinServices\bin\$Release\Most.Core.CBooking.WinServices.exe.config
Copy-Item Most.Core.CBooking.WinServices\App.$Release.config Most.Core.CBooking.WinServices\bin\$Release\Most.Core.CBooking.WinServices.exe.config

Remove-Item -force Most.Core.CBooking.WinServices\bin\$Release\NLog.config
Copy-Item Most.Core.CBooking.WinServices\NLog.$Release.config Most.Core.CBooking.WinServices\bin\$Release\NLog.config



& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core.CBooking.API\
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core.CBooking.WinServices\
copy $Filename c:\AutoDeploy\ftp_root

Remove-Item -force c:\AutoDeploy\ftp_root\Most.Core.CBooking.API.Last.$Release

cmd.exe /c mklink c:\AutoDeploy\ftp_root\Most.Core.CBooking.API.Last.$Release c:\AutoDeploy\ftp_root\$Filename
