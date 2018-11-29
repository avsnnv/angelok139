param([String]$server,[String]$Release,[String]$path_OutputService)
echo "Install API on $server release $Release to $path_OutputService"

Invoke-Command -ComputerName $server -FilePath ScriptsExpedia\LocalInstall_OutputService.ps1 -ArgumentList $Release,$path_OutputService

