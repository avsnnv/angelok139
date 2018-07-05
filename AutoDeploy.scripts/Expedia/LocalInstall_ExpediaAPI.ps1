param([String]$Release,[String]$path_ExpediaAPI)

cd c:\temp

$hostname = (hostname| Out-String).Replace("`r`n","")

(Get-Content Expedia.Core.Api\Web.$Release.config).replace('${zabbix_net}',$hostname+".mostapp.com")|Set-Content Expedia.Core.Api\Web.config
(Get-Content Expedia.Core.WinServices\App.$Release.config).replace('${zabbix_net}',$hostname+".mostapp.com")|Set-Content Expedia.Core.WinServices\bin\$Release\Expedia.Core.WinServices.exe.config


mkdir $path_ExpediaAPI
robocopy Expedia.Core.Api $path_ExpediaAPI /E 


