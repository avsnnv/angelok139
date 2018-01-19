param([String]$server)
echo "Begin stopping Services on $server"

Invoke-Command -ComputerName $server -ScriptBlock  {\
Stop-Service CoreGenerateTicketService
Stop-Service CoreDepositAirticketsService
Stop-Service CoreUpdateTrackerService
Stop-Service CoreUpdateTopTripsService
Stop-Service CoreParseWatchesToBrandService
Stop-Service CoreCancelBookingExpiringService
Stop-Service CoreRemoveTokensExperedService
Stop-Service CoreDeleteOldLogsService
Stop-Service CoreDeleteOldWatchService
}
