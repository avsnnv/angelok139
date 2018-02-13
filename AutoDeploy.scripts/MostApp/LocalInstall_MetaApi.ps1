param([String]$Release,[String]$path_MetaApi,[String]$path_MetaWCF)

cd C:\temp\Most.Core.IntegrationCore\Most.Core.Meta.API
Remove-Item -force $path_MetaApi
mkdir $path_MetaApi
robocopy . $path_MetaApi /E 

cd C:\temp\Most.Core.IntegrationCore\Most.Core.Meta.WCF
Remove-Item -force $path_MetaWCF
mkdir $path_MetaWCF
robocopy . $path_MetaWCF /E

