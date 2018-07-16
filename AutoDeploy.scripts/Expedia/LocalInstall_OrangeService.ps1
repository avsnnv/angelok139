param([String]$Release,[String]$path_Orange,$path_services)

cd c:\temp\Most.Core.OrangeDataService

robocopy bin $path_Orange\bin
robocopy OrangeData $path_Orange\OrangeData
robocopy OrangeService $path_Orange\OrangeService

mkdir C:\OrangeCertExpedia
robocopy Keys.$Release C:\OrangeCertExpedia
$password=ConvertTo-SecureString -String 1234 -AsPlainText -force
Import-PfxCertificate -Password $password -CertStoreLocation Cert:\LocalMachine\My -FilePath C:\OrangeCertExpedia\9721064335.pfx
