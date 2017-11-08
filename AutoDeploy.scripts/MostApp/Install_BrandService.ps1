param([String]$server,[String]$Release,[String]$path_BrandService)
echo "Install API on $server release $Release to $path_BrandService"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalInstall_BrandService.ps1 -ArgumentList $Release,$path_BrandService

