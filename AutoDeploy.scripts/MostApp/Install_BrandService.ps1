param([String]$server,[String]$Release,[String]$path_BrandService)
echo "Install API on $server release $Release to $path_BrandService"

Invoke-Command -ComputerName $server -ScriptBlock {
param([String]$Release,[String]$path_BrandService)

cd c:\temp\BrandService\bin
robocopy . $path_BrandService\bin /e /XF "Web.config"
cd ..
Copy-Item Web.config $path_BrandService -force
Copy-Item BrandService.svc $path_BrandService -force


} -ArgumentList $Release,$path_BrandService
