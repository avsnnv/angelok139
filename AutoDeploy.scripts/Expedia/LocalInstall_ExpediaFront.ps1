param([String]$Release,[String]$path_ExpediaFront)

cd C:\temp\
mkdir $path_ExpediaFront
robocopy Expedia.Core.Node $path_ExpediaFront /MIR
cd $path_ExpediaFront 
