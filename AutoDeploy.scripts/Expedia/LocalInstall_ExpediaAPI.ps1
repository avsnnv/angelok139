param([String]$Release,[String]$path_ExpediaAPI)

cd c:\temp
mkdir $path_Expedia
robocopy Expedia.Core.Api $path_Expedia\ 


