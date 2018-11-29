param([String]$Release,[String]$path_OutputService)

cd c:\temp

mkdir $path_OutputService
robocopy OrdersSalvatory.Core.OutputOrdersWCF $path_OutputService /E 
