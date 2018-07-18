param([String]$Release,[String]$path_Orange,$path_services)

cd c:\temp\
mkdir $path_Orange
robocopy Most.Core.OrangeDataService $path_Orange /E

mkdir C:\OrangeCertExpedia
robocopy Most.Core.OrangeDataService\Keys.$Release C:\OrangeCertExpedia
$password=ConvertTo-SecureString -String 1234 -AsPlainText -force
Import-PfxCertificate -Password $password -CertStoreLocation Cert:\LocalMachine\My -FilePath C:\OrangeCertExpedia\9721064335.pfx
