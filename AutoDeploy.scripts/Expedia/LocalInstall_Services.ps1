param([String]$Release)

Stop-Service ExpediaDepositOrderService
Stop-Service ExpediaCancelExpiringCartService
Stop-Service ExpediaUpdateCartStatusService

C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe /u c:\ExpediaServices\bin\Expedia.Core.WinServices.exe

cd c:\temp\Expredia.Core.WinServices\bin\$Release
Remove-Item -force -recurse c:\ExpediaServices
mkdir c:\ExpediaServices\bin
robocopy . C:\ExpediaServices\bin /e
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe c:\ExpediaServices\bin\Expedia.Core.WinServices.exe
Start-Service ExpediaDepositOrderService
Start-Service ExpediaCancelExpiringCartService
Start-Service ExpediaUpdateCartStatusService
