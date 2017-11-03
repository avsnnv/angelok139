param([String]$server,[String]$Release,[String]$path_Orange)
echo "Install API on $server release $Release to $path_Orange"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_OrangeService.ps1 -ArgumentList $Release,$path_Orange

