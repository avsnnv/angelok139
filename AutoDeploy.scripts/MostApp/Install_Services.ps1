param([String]$server,[String]$Release)
echo "Install Services on $server release $Release"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_Services.ps1 -ArgumentList $Release
