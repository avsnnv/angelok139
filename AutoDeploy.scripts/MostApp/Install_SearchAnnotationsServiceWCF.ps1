param([String]$server,[String]$Release,[String]$path_SearchAnnotationsServiceWCF)
echo "Install SearchAnnotationsServiceWCF on $server release $Release to $path_BrandService"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_SearchAnnotationsServiceWCF.ps1 -ArgumentList $Release,$path_SearchAnnotationsServiceWCF

