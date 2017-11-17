param([String]$server,[String]$Release,[String]$path_Sirena)
echo "Install API on $server release $Release to $path_Sirena"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_SirenaWCF.ps1 -ArgumentList $Release,$path_Sirena

