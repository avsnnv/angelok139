param([String]$path_TaxiApi,[String]$path_Services)

cd c:\temp
Remove-Item -force -Recurse $path_TaxiApi
mkdir $path_TaxiApi
Move-Item -Force Most.TaxiCore.Api\* $path_TaxiApi

Remove-Item -force -Recurse $path_Services\GettTaxiWCF
mkdir $path_Services\GettTaxiWCF
Move-Item -force Most.TaxiCore.GettService\* $path_Services\GettTaxiWCF

Remove-Item -force -Recurse $path_Services\YandexTaxiWCF
mkdir $path_Services\YandexTaxiWCF
Move-Item -force Most.TaxiCore.YandexService\* $path_Services\YandexTaxiWCF

Remove-Item -force -Recurse $path_Services\IwayTaxiWCF
mkdir $path_Services\IwayTaxiWCF
Move-Item -force Most.TaxiCore.IwayServiceRemote\* $path_Services\IwayTaxiWCF
