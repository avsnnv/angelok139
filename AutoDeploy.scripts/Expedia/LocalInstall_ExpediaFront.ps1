param([String]$Release,[String]$path_ExpediaFront)

cd C:\temp\Expedia.Core.Node
mkdir $path_ExpediaFront
Move-Item * $path_ExpediaFront 
cd $path_ExpediaFront
