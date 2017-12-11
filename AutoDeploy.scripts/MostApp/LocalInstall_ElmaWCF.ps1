param([String]$Release,[String]$path_WcfElma)

Remove-Item -force -recurse $path_WcfElma
mkdir $path_WcfElma
Move-Item c:\temp\WcfElma\* $path_WcfElma

