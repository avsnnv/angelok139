param([String]$Release,[String]$path_Service)

Remove-Item -force -recurse $path_Service
mkdir $path_Service
Move-Item c:\temp\Most.BusinessCore.System1CIntegration\* $path_Service

