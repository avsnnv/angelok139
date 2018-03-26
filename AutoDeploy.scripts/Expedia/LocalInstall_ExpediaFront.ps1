param([String]$Release,[String]$path_ExpediaFront)

cd c:\temp
mkdir $path_ExpediaFront
robocopy Expedia.Core.Node $path_ExpediaFront /E
cd $path_ExpediaFront 
npm i
npm run build:beta

