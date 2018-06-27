param([String]$Release)

Stop-Service CBookingRemoveOldRecordsService

C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe /u c:\CBookingServices\bin\Most.Core.CBooking.WinServices.exe

cd c:\temp\Most.Core.CBooking.WinServices\bin\$Release
Remove-Item -force -recurse c:\CBookingServices
mkdir c:\CBookingServices\bin
robocopy . c:\CBookingServices\bin /e
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe c:\CBookingServices\bin\Most.Core.CBooking.WinServices.exe
Start-Service CBookingRemoveOldRecordsService

