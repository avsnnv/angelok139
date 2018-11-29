param([String]$server,[String]$Release,[String]$path_Service)
echo "Install 1CIntegration on $server release $Release to $path_Service"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall1CIntegration.ps1 -ArgumentList $Release,$path_Service

