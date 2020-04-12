﻿param([String]$server,[String]$Release)
echo "Install Services on $server release $Release"

Invoke-Command -ComputerName $server -FilePath ScriptsExpedia\LocalInstall_SalvatoryServices.ps1 -ArgumentList $Release