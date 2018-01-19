param([String]$server,[String]$Release,[String]$path_SearchAnnotationsServiceWCF)
echo "Install SearchAnnotationsServiceWCF on $server release $Release to $path_SearchAnnotationsServiceWCF"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_SearchAnnotationsServiceWCF.ps1 -ArgumentList $Release,$path_SearchAnnotationsServiceWCF

