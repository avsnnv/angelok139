param([String]$server,[String]$Release,[String]$path_ExpediaFront,$runCommand)
echo "Install API on $server release $Release to $path_ExpediaFront"

Invoke-Command -ComputerName $server -FilePath LocalInstall_ExpediaFront.ps1 -ArgumentList $Release,$path_ExpediaFront,$runCommand

