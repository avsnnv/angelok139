param([String]$Release,[String]$path_WcfAPI)

Remove-Item -force -recurse $path_WcfAPI
mkdir $path_WcfAPI
Move-Item c:\temp\Most.Core.API.WCF\* $path_WcfElma

