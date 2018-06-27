param([String]$Release,[String]$path_ExpediaFront)

cd C:\temp\
mkdir $path_ExpediaFront
robocopy Expedia.Core.Node $path_ExpediaFront /e
cd $path_ExpediaFront 
