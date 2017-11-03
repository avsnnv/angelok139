param([String]$Release,[String]$path_Orange)

cd c:\temp\Most.Core\Most.Core.OrangeDataService

robocopy bin $path_Orange\bin
robocopy OrangeData $path_Orange\OrangeData
robocopy OrangeService $path_Orange\OrangeService

Copy-Item Web.$Release.config $path_Orange\Web.config
robocopy Keys.$Release C:\OrangeCert
& "C:\Program Files\7-Zip\7z" x C:\OrangeCert\7708279602.rar -oc:\OrangeCert\ -y
$password=ConvertTo-SecureString -String 1234 -AsPlainText -force
Import-PfxCertificate -Password $password -CertStoreLocation Cert:\LocalMachine\My -FilePath C:\OrangeCert\7708279602.pfx


