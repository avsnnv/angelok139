param([String]$Release,[String]$path_SearchAnnotationsServiceWCF)

Remove-Item -force -recurse $path_SearchAnnotationsServiceWCF
mkdir $path_SearchAnnotationsServiceWCF
Move-Item c:\temp\SearchAnnotationsServiceWCF\* $path_SearchAnnotationsServiceWCF

