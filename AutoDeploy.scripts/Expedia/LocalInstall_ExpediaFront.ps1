param([String]$Release,[String]$path_ExpediaFront)

cd c:\temp
mkdir $path_ExpediaFront
robocopy . $path_ExpediaFront /E
cd $path_ExpediaFront 

