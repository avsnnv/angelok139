param($Filename,[String]$Release)

echo "Prepare and Archive Distributive CbookingAPI for $Release enviropment to $Filename"

Remove-Item -force Most.TaxiCore.Api\Web.config
Copy-Item Most.TaxiCore.Api\Web.$Release.config Most.TaxiCore.Api\Web.config
Remove-Item -force Most.TaxiCore.GettService\Web.config
Copy-Item Most.TaxiCore.GettService\Web.$Release.config Most.TaxiCore.GettService\Web.config
Remove-Item -force Most.TaxiCore.YandexService\Web.config
Copy-Item Most.TaxiCore.GettService\Web.$Release.config Most.TaxiCore.YandexService\Web.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.TaxiCore.Api
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.TaxiCore.GettService
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.TaxiCore.YandexService

copy $Filename c:\AutoDeploy\ftp_root

Remove-Item -force c:\AutoDeploy\ftp_root\Most.Core.Taxi.API.Last.$Release

cmd.exe /c mklink c:\AutoDeploy\ftp_root\Most.Core.Taxi.API.Last.$Release c:\AutoDeploy\ftp_root\$Filename
