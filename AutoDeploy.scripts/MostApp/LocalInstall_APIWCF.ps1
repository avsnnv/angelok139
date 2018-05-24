param([String]$Release,[String]$path_WcfAPI)

Remove-Item -force -recurse $path_WcfAPI
mkdir $path_WcfAPI
Move-Item C:\temp\Most.Core\Most.Core.API.WCF\* $path_WcfAPI

