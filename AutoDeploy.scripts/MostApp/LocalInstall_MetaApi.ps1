param([String]$Release,[String]$path_MetaApi)

cd C:\temp\Most.Core.IntegrationCore\Most.Core.Meta.API
Remove-Item -force $path_MetaApi
mkdir $path_MetaApi
robocopy . $path_MetaApi /E 

