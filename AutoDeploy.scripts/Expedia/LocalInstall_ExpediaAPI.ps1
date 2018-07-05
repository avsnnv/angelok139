param([String]$Release,[String]$path_ExpediaAPI)

cd c:\temp

git clone https://github.com/angelok139/angelok139
cd angelok139
javac DevOps\src\devops\*
java -cp .\DevOps\src devops.Patch --inputfile=..\Expedia.Core.Api\Web.$Release.config --outputfile=..\Expedia.Core.Api\Web.config --patchfile=.\Patches\testserver.patch
java -cp .\DevOps\src devops.Patch --inputfile=..\Expedia.Core.WinServices\App.$Release.config --outputfile=..\Expedia.Core.WinServices\App.config --patchfile=.\Patches\testserver.patch
cd c:\temp
mkdir $path_ExpediaAPI
robocopy Expedia.Core.Api $path_ExpediaAPI /E 


