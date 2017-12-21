param([String]$path_TaxiApi,[String]$path_Services)

cd c:\temp
Remove-Item -force $path_TaxiApi
mkdir $path_TaxiApi
Move-Item -Recurse Most.TaxiCore.Api\* $path_TaxiApi

Remove-Item -force $path_Services
mkdir $path_Services
Move-Item -Recurse Most.TaxiCore.GettService\* $path_Services

