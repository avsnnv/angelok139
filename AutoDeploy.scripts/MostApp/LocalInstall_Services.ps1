param([String]$Release)

Stop-Service CoreGenerateTicketService
Stop-Service CoreDepositAirticketsService
Stop-Service CoreUpdateTrackerService
Stop-Service CoreUpdateTopTripsService
Stop-Service CoreParseWatchesToBrandService
Stop-Service CoreCancelBookingExpiringService
Stop-Service CoreRemoveTokensExperedService
Stop-Service CoreDeleteOldLogsService
Stop-Service CoreDeleteOldWatchService

C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe /u C:\CoreServices\bin\Most.Core.API.Services.exe

cd c:\temp\Most.Core\Most.Core.API.Services\bin\$Release
robocopy . C:\CoreServices\bin /e /XD "References"
cd References
robocopy . C:\CoreServices\References /e
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe C:\CoreServices\bin\Most.Core.API.Services.exe

Start-Service CoreGenerateTicketService
Start-Service CoreDepositAirticketsService
Start-Service CoreUpdateTrackerService
Start-Service CoreUpdateTopTripsService
Start-Service CoreParseWatchesToBrandService
Start-Service CoreCancelBookingExpiringService
Start-Service CoreRemoveTokensExperedService
Start-Service CoreDeleteOldLogsService
Start-Service CoreDeleteOldWatchService

