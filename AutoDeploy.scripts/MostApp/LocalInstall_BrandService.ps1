param([String]$Release,[String]$path_BrandService)

cd c:\temp\BrandService\bin
robocopy . $path_BrandService\bin /e /XF "Web.config"
cd ..
Copy-Item Web.config $path_BrandService -force
Copy-Item BrandService.svc $path_BrandService -force

