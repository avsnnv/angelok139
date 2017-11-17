param($Filename,$ftpUser,$ftpPass,$Release, $path_api,$path_orange,$path_stats)
./LocalDownloadExtract.ps1 $Filename,$ftpUser,$ftpPass
./LocalInstall_Api.ps1 $Release,$path_api
./LocalInstall_OrangeService.ps1 $Release,$path_orange
./LocalInstall_Services.ps1 $Release
./LocalInstall_Stats.ps1 $Release,$path_stats

