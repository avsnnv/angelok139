param([String]$Release,[String]$path_ExpediaAPI)

cd c:\temp
mkdir $path_ExpediaAPI
robocopy Expedia.Core.Api $path_ExpediaAPI 


